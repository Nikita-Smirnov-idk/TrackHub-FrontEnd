//
//  Sigh.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.01.2025.
//

import SwiftUI

struct SignUpInfo{
    let fields: [SignUpData] = [
        SignUpData(fieldText: "Имя", fieldFocus: .firstName),
        SignUpData(fieldText: "Фамилия", fieldFocus: .lastName),
        SignUpData(fieldText: "Почта", fieldFocus: .email),
        SignUpData(fieldText: "Пароль", fieldFocus: .password),
        SignUpData(fieldText: "Повтор пароля", fieldFocus: .repeatPassword)
    ]
}
