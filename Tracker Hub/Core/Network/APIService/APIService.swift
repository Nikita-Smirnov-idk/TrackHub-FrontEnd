import Foundation
import SwiftKeychainWrapper

// Модель для ответа с токенами и идентификатором пользователя
struct TokenResponse: Codable {
    let access_token: String
    let refresh_token: String
    let user_id: String?  // Преобразуем в String для удобства хранения

    enum CodingKeys: String, CodingKey {
        case access_token = "access"
        case refresh_token = "refresh"
        case user_id = "user_id"
    }
    
    // Если сервер возвращает user_id как число, преобразуем его в строку
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.access_token = try container.decode(String.self, forKey: .access_token)
        self.refresh_token = try container.decode(String.self, forKey: .refresh_token)
        if let idInt = try? container.decode(Int.self, forKey: .user_id) {
            self.user_id = String(idInt)
        } else {
            self.user_id = try container.decodeIfPresent(String.self, forKey: .user_id)
        }
    }
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case unauthorized
    case noData
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid response from the server."
        case .unauthorized:
            return "Unauthorized. Please check your credentials."
        case .noData:
            return "No data received from the server."
        case .serverError(let code):
            return "Server error with status code: \(code)."
        }
    }
}

class APIService {
    static let shared = APIService()
    private init() {}
    
    /// Универсальный метод для запросов, который добавляет access-токен, если требуется авторизация.
    /// При получении 401 происходит попытка обновления токена и повтор запроса.
    func request<T: Codable>(
        urlString: String,
        method: String,
        body: Data? = nil,
        requiresAuth: Bool = true,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            let error = APIError.invalidURL
            print("Request error: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        // Добавляем токен, если требуется авторизация
        if requiresAuth, let accessToken = KeychainWrapper.standard.string(forKey: "accessToken") {
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        
        print("Sending request to: \(urlString)")
        if let body = body, let bodyString = String(data: body, encoding: .utf8) {
            print("Request body: \(bodyString)")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Обработка ошибки соединения
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = APIError.invalidResponse
                print("Response error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            // Если получен статус 401 (Unauthorized) — пробуем обновить токен
            if httpResponse.statusCode == 401 && requiresAuth {
                print("Received 401. Attempting to refresh token...")
                self.refreshAccessToken { success in
                    if success {
                        self.request(urlString: urlString, method: method, body: body, requiresAuth: requiresAuth, completion: completion)
                    } else {
                        let error = APIError.unauthorized
                        print("Token refresh failed: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
                }
                return
            }
            
            guard let data = data else {
                let error = APIError.noData
                print("Data error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            // Выводим сырые данные ответа для отладки
            if let responseString = String(data: data, encoding: .utf8) {
                print("Raw response JSON: \(responseString)")
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                
                // Если результат — токены, сохраняем их и user_id
                if let tokenResponse = result as? TokenResponse {
                    KeychainWrapper.standard.set(tokenResponse.access_token, forKey: "accessToken")
                    KeychainWrapper.standard.set(tokenResponse.refresh_token, forKey: "refreshToken")
                    if let userID = tokenResponse.user_id {
                        KeychainWrapper.standard.set(userID, forKey: "userID")
                    }
                }
                
                completion(.success(result))
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// Метод для логина пользователя. Отправляет POST-запрос с email и password,
    /// получает токены и сохраняет их.
    func login(user: SignInUserModel, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let urlString = "http://127.0.0.1:8000/users/account/login/"
        guard let url = URL(string: urlString) else {
            let error = APIError.invalidURL
            print("Login error: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let bodyData = try JSONEncoder().encode(user)
            request.httpBody = bodyData
            if let jsonString = String(data: bodyData, encoding: .utf8) {
                print("Encoded JSON for login: \(jsonString)")
            } else {
                print("Unable to convert encoded data to string")
            }
        } catch {
            print("Encoding error in login: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error in login: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = APIError.invalidResponse
                print("Response error in login: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            if httpResponse.statusCode != 200 {
                let error = APIError.serverError(httpResponse.statusCode)
                print("Server error in login: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = APIError.noData
                print("Data error in login: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Raw response JSON: \(responseString)")
            } else {
                print("Unable to convert response data to string")
            }
            
            do {
                let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
                KeychainWrapper.standard.set(tokenResponse.access_token, forKey: "accessToken")
                KeychainWrapper.standard.set(tokenResponse.refresh_token, forKey: "refreshToken")
                if let userID = tokenResponse.user_id {
                    KeychainWrapper.standard.set(userID, forKey: "userID")
                }
                completion(.success(tokenResponse))
            } catch {
                print("Decoding error in login: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// Метод для регистрации пользователя.
    func register(user: SignUpUserModel, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        let urlString = "http://127.0.0.1:8000/users/account/"
        guard let url = URL(string: urlString) else {
            let error = APIError.invalidURL
            print("Register error: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let bodyData = try JSONEncoder().encode(user)
            request.httpBody = bodyData
            if let jsonString = String(data: bodyData, encoding: .utf8) {
                print("Encoded JSON for register: \(jsonString)")
            } else {
                print("Unable to convert encoded data to string")
            }
        } catch {
            print("Encoding error in register: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error in register: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = APIError.invalidResponse
                print("Response error in register: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            if httpResponse.statusCode != 200 {
                let error = APIError.serverError(httpResponse.statusCode)
                print("Server error in register: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = APIError.noData
                print("Data error in register: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Raw response JSON: \(responseString)")
            } else {
                print("Unable to convert response data to string")
            }
            
            do {
                let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
                KeychainWrapper.standard.set(tokenResponse.access_token, forKey: "accessToken")
                KeychainWrapper.standard.set(tokenResponse.refresh_token, forKey: "refreshToken")
                if let userID = tokenResponse.user_id {
                    KeychainWrapper.standard.set(userID, forKey: "userID")
                }
                completion(.success(tokenResponse))
            } catch {
                print("Decoding error in register: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// Метод для обновления access-токена с использованием refresh-токена.
    private func refreshAccessToken(completion: @escaping (Bool) -> Void) {
        let urlString = "http://127.0.0.1:8000/users/token/refresh/"
        guard let url = URL(string: urlString) else {
            print("Refresh token error: invalid URL")
            completion(false)
            return
        }
        
        guard let refreshToken = KeychainWrapper.standard.string(forKey: "refreshToken") else {
            print("Refresh token error: no refresh token found")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["refresh_token": refreshToken]
        request.httpBody = try? JSONEncoder().encode(body)
        
        print("Sending refresh token request with refresh_token: \(refreshToken)")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error during token refresh: \(error?.localizedDescription ?? "Unknown error")")
                completion(false)
                return
            }
            
            do {
                let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
                KeychainWrapper.standard.set(tokenResponse.access_token, forKey: "accessToken")
                KeychainWrapper.standard.set(tokenResponse.refresh_token, forKey: "refreshToken")
                if let userID = tokenResponse.user_id {
                    KeychainWrapper.standard.set(userID, forKey: "userID")
                }
                print("Token refresh successful: \(tokenResponse)")
                completion(true)
            } catch {
                print("Decoding error during token refresh: \(error.localizedDescription)")
                completion(false)
            }
        }
        task.resume()
    }
}
