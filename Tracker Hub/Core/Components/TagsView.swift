//
//  TagsView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.03.2025.
//

import SwiftUI

struct TagsView: View {
    let tags: [String] /*= ["Зал", "Дом", "Предплечье", "Икры", "С оборудованием", "Скакалка"]*/
    
    var geometry: GeometryProxy
    var body: some View {
        FlowLayout(items: tags, spacing: 8) { tag in
            Text(tag)
                .padding(.horizontal, 12)  // горизонтальные отступы
                .padding(.vertical, 8)
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                .foregroundColor(Color(DataSource().selectedTheme.primaryColor))
                .background(Color(DataSource().selectedTheme.buttonsBackgroundColor))
                .cornerRadius(20)
        }
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.0)
        .padding()
    }
}


