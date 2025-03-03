//
//  FirstQuestionButton.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.01.2025.
//

import SwiftUI

struct FirstQuestionButton: View {
    let title: String
    let action: () -> Void
    let width: CGFloat
    let height: CGFloat
    let theme: Theme // Предположим, что у вас есть структура Theme

    var body: some View {
        Button(action: action) {
            Text(title)
                .fixedSize(horizontal: true, vertical: true)
                .multilineTextAlignment(.center)
                .padding(.all)
                .frame(width: width, height: height)
                .foregroundColor(Color(theme.primaryColor))
                .background(Color(theme.secondaryBackgroundColor))
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 20))
                .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft]))
        }
    }
}
