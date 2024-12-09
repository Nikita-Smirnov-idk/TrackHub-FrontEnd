//
//  WorkoutTypesView.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 09.12.2024.
//

//
//  MenuView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.12.2024.
//

import SwiftUI

struct WorkoutTypesView: View {
    @EnvironmentObject var dataSource: DataSource
    @State private var searchText = ""
    @State var isPushedFemale: Bool = false
    @State var isPushedMale: Bool = false

    @State var buttonsText = [
        "Силовые тренировки",
        "Кардио тренировки",
        "Растяжка и гибкость",
        "Сбалансированные тренировки",
        "Единоборства",
        "Единоборства",
        "Единоборства",
        "Единоборства",
        "Единоборства",
    ]

    var body: some View {
        GeometryReader { geometry in
            let geometryWidth = geometry.size.width
            
            ScrollView {
                ForEach(0..<buttonsText.count, id: \.self) { i in
                    Button() {
                        // code for action of button
                    } label: {
                        Text(buttonsText[i])
                            .frame(width: geometryWidth * 0.7)
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding([.bottom, .top])
                            .foregroundColor(Color(dataSource.selectedTheme.secondaryFontColor))
                            .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: RelativeFontSize(size: 13, func_coef: 10, plus_value: 2.7, divider_value: 4.1)))
                            
                            .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topRight, .bottomLeft, .topLeft, .bottomRight]))
                        
                    }
                    .padding([.bottom, .top], 10.0)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(dataSource.selectedTheme.backgroundColor))
    }
}

#Preview {
    WorkoutTypesView().environmentObject(DataSource())
}
