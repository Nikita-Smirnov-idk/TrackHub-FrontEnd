//
//  StringExtension.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.02.2025.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        // Регулярное выражение для проверки email (учитывает большинство случаев)
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        // Пример: пароль должен содержать минимум 8 символов,
        // как минимум одну заглавную, одну строчную букву и одну цифру.
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: self)
    }
}
