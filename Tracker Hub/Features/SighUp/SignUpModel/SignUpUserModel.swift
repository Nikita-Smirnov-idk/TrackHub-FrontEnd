//
//  SignUpUserModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.02.2025.
//

import Foundation

struct SignUpUserModel: Codable, Equatable {
    var email: String = ""
    var password: String = ""
    var firstName: String = ""
    var lastName: String = ""
}
