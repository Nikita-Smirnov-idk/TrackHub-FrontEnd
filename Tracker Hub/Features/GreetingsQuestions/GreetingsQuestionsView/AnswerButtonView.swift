//
//  AnswerButtonView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.01.2025.
//

import SwiftUI

struct AnswerButton: View {
    let index: Int
    let text: String
    let answers: [String]
    let geometry: GeometryProxy
    let action: () -> Void
    @EnvironmentObject var dataSource: DataSource
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                .fixedSize(horizontal: true, vertical: true)
                .multilineTextAlignment(.center)
                .padding([.bottom, .top])
                .frame(
                    width: AdaptiveValue(
                        idealValue: geometry.size.width / 1.75,
                        minValue: 300,
                        maxValue: 450
                    ),
                    height: AdaptiveValue(
                        idealValue: geometry.size.height / 10,
                        minValue: 60,
                        maxValue: 80
                    )
                )
                .background(
                    Rectangle()
                        .fill(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                        .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: (index == 0 ? [.bottomLeft, .topRight] : index == answers.count-1 ? [.bottomRight, .topLeft] : [.bottomRight, .topRight]))))
                .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
        }
    }
}

