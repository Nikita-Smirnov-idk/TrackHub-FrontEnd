//
//  SignUpViewModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.02.2025.
//
import Foundation

class SignUpViewModel {
    @Published var userData: SignUpUserModel
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    init(userData: SignUpUserModel) {
            self.userData = userData
        }
    
    /// Функция входа, использующая APIService.shared.login(...)
    func signUp() {
        // Вызываем метод логина, который должен быть реализован в APIService
        APIService.shared.register(user: userData) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let tokenResponse):
                    print("Логин успешен. Access token: \(tokenResponse.access_token)")
                    // Если логин успешен, можно установить флаг
                    self.isLoggedIn = true
                    self.errorMessage = nil
                case .failure(let error):
                    print("Ошибка логина: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                    self.isLoggedIn = false
                }
            }
        }
    }
}
