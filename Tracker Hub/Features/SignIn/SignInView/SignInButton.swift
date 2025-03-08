//
//  SignInButton.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.02.2025.
//

import SwiftUI

struct SignInButton: View {
    let geometry: GeometryProxy
    @StateObject var dataSource = DataSource()
    var mainManager: MainManager
    @Binding var isSignIn: Bool
    @Binding var user: SignInUserModel

    @ObservedObject var viewModel: SignInViewModel
    
    init(geometry: GeometryProxy,
             mainManager: MainManager,
             isSignIn: Binding<Bool>,
             user: Binding<SignInUserModel>) {
            self.geometry = geometry
            self.mainManager = mainManager
            self._isSignIn = isSignIn
            self._user = user
            // Инициализируем viewModel с начальным значением, взятым из user.wrappedValue
            self.viewModel = SignInViewModel(userData: user.wrappedValue)
        }
    
    var body: some View {
        Button(action: { buttonAction() }){
            Text("Войти")
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
                        .fill(isSignIn ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.buttonsBackgroundColor)))
                .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
        }
        .disabled(!isSignIn)
    }
    
    private func buttonAction(){
        print("email: \(user.email), password: \(user.password)")
        viewModel.signIn()
        if viewModel.isLoggedIn {
            mainManager.currentView = .main
            print("перехожу на основной экран")
        }
        else{
            print("Неверный email или пароль")
            Text("Неверный email или пароль")
                .font(Font.custom(Fonts.ReadexPro_Regular.rawValue, size: 16))
                .foregroundColor(Color(dataSource.selectedTheme.secondaryBackgroundColor))
        }
    }
}
