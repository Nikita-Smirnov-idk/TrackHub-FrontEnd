//
//  SecurityFieldView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.01.2025.
//

import SwiftUI

struct SecurityFieldView: View {
    let geometry: GeometryProxy
    let backgroundText: String
    let index: Int
    @Binding var fieldTextInfo: String
    @State private var isShown: Bool = false
//    @FocusState private var focus: FormsFieldFocus?
    
    @EnvironmentObject var dataSource: DataSource
    var body: some View {
        HStack {
            if isShown {
                TextField(backgroundText, text: $fieldTextInfo)
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
            }
            else {
                SecureField(backgroundText, text: $fieldTextInfo)
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
            }
            
            Button(action: {
                isShown.toggle()
            }) {
                Image(systemName: !isShown ? "eye.slash" : "eye")
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
            }
            .padding()
        }
        .frame(
            width: AdaptiveValue(
                idealValue: geometry.size.width / 1.75,
                minValue: 300,
                maxValue: 450
            ),
            height: AdaptiveValue(
                idealValue: geometry.size.height / 10,
                minValue: 40,
                maxValue: 60
            )
        )
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(dataSource.selectedTheme.backgroundColor)))
    }
}

//#Preview {
//    GeometryReader { geometry in
//        SecurityFieldView(geometry: geometry, backgroundText: "password", index: 0).environmentObject(DataSource())
//    }
//}

