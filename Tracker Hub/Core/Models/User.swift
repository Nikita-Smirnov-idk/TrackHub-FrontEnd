//
//  PlugUser.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.02.2025.
//

import SwiftUI
import Foundation

struct User: Codable, Equatable, Hashable {
    var id: Int = 0
    var email: String = ""
    var password: String = ""      // Отсутствует в JSON, будет иметь значение ""
    var phoneNumber: String = ""   // Отсутствует в JSON
    var isMale: Bool = true        // Отсутствует в JSON
    var isTrener: Bool = false     // Отсутствует в JSON
    var avatar: String = ""
    var name: String = ""
    var surname: String = ""
    var notifications: [String] = [] // Отсутствует в JSON
    var rating: Double = 0

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case avatar
        case name = "first_name"
        case surname = "last_name"
        case rating = "user_rating"
    }
}
