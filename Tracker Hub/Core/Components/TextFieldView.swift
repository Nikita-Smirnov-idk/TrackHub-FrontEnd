//
//  TextFieldView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.01.2025.
//

import SwiftUI

struct TextFieldView: View {
    let geometry: GeometryProxy
    let backgroundText: String
    let index: Int
    @Binding var fieldTextInfo: String
//    @FocusState private var focus: FormsFieldFocus?
    
    @EnvironmentObject var dataSource: DataSource
    var body: some View {
        TextField(backgroundText, text: $fieldTextInfo)
            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
//            .onSubmit {
//                focus = .password
//            }
//            .onAppear {
//                focus = .firstName
//            }
            .padding()
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
//                    .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: (index == 0 ? [.bottomLeft, .topRight] : index == 3 ? [.bottomRight, .topLeft] : [.bottomRight, .topRight]))))
            .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
        
    }
}

//#Preview {
//    GeometryReader { geometry in
//        TextFieldView(geometry: geometry, backgroundText: "Email", index: 0).environmentObject(DataSource())
//    }
//}
