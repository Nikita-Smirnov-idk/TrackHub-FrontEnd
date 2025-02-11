//
//  PlugUser.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.02.2025.
//

import SwiftUI
import Foundation

struct PlugUser: Equatable {
    var id = UUID()
    var email : String
    var password : String
    var phoneNumber : String
    var isMale: Bool
    var isTrener : Bool
    var avatar : String
    var name : String
    var surname : String
    var notifications : Array<String>
    var rating : Double
}
