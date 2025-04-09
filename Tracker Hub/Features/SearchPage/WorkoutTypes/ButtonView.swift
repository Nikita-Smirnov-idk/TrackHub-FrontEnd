//
//  ButtonView.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 10.12.2024.
//

import SwiftUI

struct ButtonWithFlash: View {
    @EnvironmentObject var dataSource: DataSource
    
    let geometry: GeometryProxy
    let text: String
    // Состояние для мигания конкретной кнопки
    @State private var flashOpacity = false
    @State private var flashDuration = 0.13
    
    var body: some View {
        Button( action: {
            flashButton()
        }) {
            Text(text)
                .frame(width: AdaptiveValue(idealValue: geometry.size.width / 2, minValue: 250, maxValue: 500))
                .fixedSize(horizontal: true, vertical: false)
                .multilineTextAlignment(.center)
                .padding([.bottom, .top])
                .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 13))
            
                .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft, .topLeft, .bottomRight]))
                .opacity(flashOpacity ? 0.1 : 1) // Применяем мигание
                .animation(.easeInOut(duration: flashDuration).repeatCount(1, autoreverses: true), value: flashOpacity)
            
        }
        .padding([.bottom, .top], 10.0)
        .contentShape(Rectangle())
        .simultaneousGesture(TapGesture())
    }
    
    
    func flashButton() {
            // Мигание будет происходить при нажатии на кнопку
            flashOpacity.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + flashDuration) {
                flashOpacity.toggle()
            }
    }
}
