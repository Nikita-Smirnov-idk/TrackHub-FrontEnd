//
//  CardFullScreenButton.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 09.03.2025.
//

import SwiftUI

public struct CardFullScreenButton: View {
    var dataSource: DataSource
    var geometry: GeometryProxy
    
    public var body: some View {
        HStack(alignment: .center, spacing: 60) {
            Image(systemName: "arrowshape.turn.up.backward")
                .resizable()
                .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                .frame(width: geometry.size.width * 0.07, height: geometry.size.width * 0.07)
            
            Image(systemName: "plus.circle")
                .resizable()
                .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                .frame(width: geometry.size.width * 0.12, height: geometry.size.width * 0.12)
            
            Image(systemName: "star")
                .resizable()
                .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                .frame(width: geometry.size.width * 0.07, height: geometry.size.width * 0.07)
        }
        .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.15, alignment: .center)
        .background(.thinMaterial) // системный материал с эффектом размытия
        .clipShape(RoundedRectangle(cornerRadius: 10)) // скругленные углы для красоты
        .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}
