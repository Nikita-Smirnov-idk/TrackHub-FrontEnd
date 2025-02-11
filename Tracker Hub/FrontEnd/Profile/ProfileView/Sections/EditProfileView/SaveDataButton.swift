//
//  SaveDataButton.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 11.02.2025.
//

import SwiftUI

struct SaveDataButton: View {
    @StateObject var dataSource = DataSource()
    @State var hasChanges: Bool
    @Binding var user: PlugUser
    @Binding var tempUser: PlugUser
    var geometry: GeometryProxy
    
    var body: some View {
        Button(action: {saveData()}){
            Text("Сохранить")
                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.08)
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
                .background(hasChanges ? Color(dataSource.selectedTheme.primaryColor):Color(dataSource.selectedTheme.secondaryBackgroundColor))
                .cornerRadius(20)
        }
    }
    
    private func saveData() {
        print("Данные сохранены")
        
        if hasChanges {
            user = tempUser
        }
    }
}
