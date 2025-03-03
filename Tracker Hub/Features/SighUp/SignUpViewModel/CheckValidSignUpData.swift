//
//  CheckValidData.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.02.2025.
//

import SwiftUI

class CheckValidSignUpData: ObservableObject {
    @Published var user: SignUpUserModel
    @Published var repeatPassword: String
    
    // Пример проверки: все поля должны быть заполнены и соответствовать формату
    var isFormValid: Bool {
        return !user.firstName.isEmpty &&
                !user.lastName.isEmpty &&
               user.email.isValidEmail &&
                !user.password.isEmpty &&
               user.password == repeatPassword
    }
    
    // Другой вариант – выводить ошибки
    var emailValidationMessage: String? {
        if user.email.isEmpty {
            return "Email не должен быть пустым"
        }
        if !user.email.isValidEmail {
            return "Неверный формат email"
        }
        return nil
    }
    
    var passwordValidationMessage: String? {
        if user.password.isEmpty {
            return "Пароль не должен быть пустым"
        }
        if !user.password.isValidPassword {
            return "Пароль должен содержать минимум 8 символов, включать заглавные и строчные буквы, а также цифру"
        }
        return nil
    }
    
    // Инициализатор и другая логика ViewModel...
    
    init(user: SignUpUserModel, repeatPassword: String) {
        self.user = user
        self.repeatPassword = repeatPassword
    }
}

