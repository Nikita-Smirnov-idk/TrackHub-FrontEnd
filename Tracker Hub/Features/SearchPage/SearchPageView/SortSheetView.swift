//
//  SortSheetView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 03.03.2025.
//

import SwiftUI

struct SortSheetView: View {
    var geometry: GeometryProxy
    @Binding var selectedOption: String?
    @State private var dataSource = DataSource()
    @State private var sortOptions: [String] = [
        "Новые",
        "Старые",
        "Высокий рейтинг",
        "Популярные"
    ]
    
    var body: some View {
        ForEach(Array(sortOptions.enumerated()), id: \.element) { index, option in
            Button {
                selectedOption = option
            } label: {
                Text(option)
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
            }
            
        }
    }
}
