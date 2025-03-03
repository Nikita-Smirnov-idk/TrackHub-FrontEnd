//
//  SignUpButton.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.02.2025.
//

import SwiftUI

struct SignUpButton: View {
    let geometry: GeometryProxy
    @StateObject var dataSource = DataSource()
    var mainManager: MainManager
    @Binding var isSignUp: Bool
    
    var body: some View {
        Button(action: { buttonAction() }){
            Text("Зарегистрироваться")
                .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: true, vertical: true)
                .padding()
                .frame(
                    width: AdaptiveValue(
                        idealValue: geometry.size.width / 1.75,
                        minValue: 300,
                        maxValue: 450
                    ),
                    height: AdaptiveValue(
                        idealValue: geometry.size.height / 10,
                        minValue: 45,
                        maxValue: 65
                    )
                )
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isSignUp ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.buttonsBackgroundColor)))
                .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
        }
        .disabled(!isSignUp)
    }
    
    private func buttonAction(){
        mainManager.currentView = .main
    }
}
