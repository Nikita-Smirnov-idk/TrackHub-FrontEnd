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
    var titleField: Binding<String>
    
    let originalText: String
        
        init(title: String, titleField: Binding<String>) {
            self.title = title
            self.titleField = titleField
            
            // «Снимок» текущего значения
            self.originalText = titleField.wrappedValue
        }
}
