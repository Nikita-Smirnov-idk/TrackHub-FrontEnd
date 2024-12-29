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
    @State private var isPressed = false // To track the button's pressed state
    @State private var opacity: Double = 1.0 // To control the button's opacity

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
        "Единоборства",
        "Единоборства",
        "Единоборства",
    ]
    @State private var flashOpacity: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            GeometryReader { geometry in
                ScrollView {
                    VStack{
                        ForEach(0..<buttonsText.count, id: \.self) { i in
                            ButtonWithFlash(geometry: geometry, text: buttonsText[i]).environmentObject(dataSource)
                        }.frame(maxWidth: .infinity)
                    }
                }.simultaneousGesture(DragGesture())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(dataSource.selectedTheme.backgroundColor))
        }
    }
}



#Preview {
    WorkoutTypesView().environmentObject(DataSource())
}
