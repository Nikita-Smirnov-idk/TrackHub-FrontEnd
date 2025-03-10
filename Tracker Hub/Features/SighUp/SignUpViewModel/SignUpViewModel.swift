//
//  SignUpViewModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.02.2025.
//
import Foundation

class SignUpViewModel: ObservableObject {
    @Published var userData: SignUpUserModel
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    init(userData: SignUpUserModel) {
        self.userData = userData
    }
    
    /// Функция регистрации, использующая APIService.shared.register(...)
    func signUp() {
        APIService.shared.register(user: userData) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let messageResponse):
                    print("Регистрация успешна. Сообщение: \(messageResponse.message)")
                    self.isLoggedIn = true
                    self.errorMessage = nil
                case .failure(let error):
                    print("Ошибка регистрации: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                    self.isLoggedIn = false
                }
            }
        }
    }
}
