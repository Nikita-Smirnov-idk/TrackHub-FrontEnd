//
//  SignUpData.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.01.2025.
//

import SwiftUI

struct SignUpData: Identifiable {
    var id: UUID = UUID()
    var fieldText: String
    var fieldFocus: SignUpFieldFocus?
}
