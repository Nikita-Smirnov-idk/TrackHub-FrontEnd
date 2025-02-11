//
//  EditProfileSection.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.02.2025.
//

import SwiftUI

struct EditProfileSection: Identifiable {
    let id = UUID()
    let title: String
    let titleField: Binding<String>
}
