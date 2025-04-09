//
//  SignInInfo.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.01.2025.
//

import SwiftUI

struct SignInInfo{
    let fields: [SignInData] = [
        SignInData(fieldText: "Почта", fieldFocus: .email),
        SignInData(fieldText: "Пароль", fieldFocus: .password)
    ]
}
