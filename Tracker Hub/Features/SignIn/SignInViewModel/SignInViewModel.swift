//
//  SignInViewModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.02.2025.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var userData: SignInUserModel
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    init(userData: SignInUserModel) {
            self.userData = userData
    }
    
    /// Функция входа, использующая APIService.shared.login(...)
    func signIn() {
        // Вызываем метод логина, который должен быть реализован в APIService
        APIService.shared.login(user: userData) { result in
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

