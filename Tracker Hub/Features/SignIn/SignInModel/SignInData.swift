//
//  SignInData.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.01.2025.
//

import SwiftUI

struct SignInData: Identifiable {
    var id: UUID = UUID()
    var fieldText: String
    var fieldFocus: SignInFieldFocus?
}
