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

    @State private var isPressed = false // Состояние для анимации нажатия

    init(geometry: GeometryProxy,
         mainManager: MainManager,
         isSignIn: Binding<Bool>,
         user: Binding<SignInUserModel>) {
        self.geometry = geometry
        self.mainManager = mainManager
        self._isSignIn = isSignIn
        self._user = user
        self.viewModel = SignInViewModel(userData: user.wrappedValue)
    }

    var body: some View {
        Button(action: {
            isPressed = true // Анимация нажатия
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPressed = false // Возвращаем состояние обратно
                buttonAction() // Выполняем действие кнопки
            }
        }) {
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
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(dataSource.selectedTheme.primaryColor),
                                    Color(dataSource.selectedTheme.secondaryFontColor)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .shadow(
                            color: Color(dataSource.selectedTheme.primaryColor).opacity(0.5),
                            radius: isPressed ? 10 : 5,
                            x: 0,
                            y: isPressed ? 5 : 2
                        )
                )
                .foregroundColor(.white) // Цвет текста
                .scaleEffect(isPressed ? 0.95 : 1.0) // Анимация нажатия
                .animation(.easeInOut(duration: 0.2), value: isPressed) // Плавная анимация
        }
        .disabled(!isSignIn)
        .opacity(isSignIn ? 1.0 : 0.6) // Прозрачность, если кнопка неактивна
    }

    private func buttonAction() {
        print("email: \(user.email), password: \(user.password)")
        viewModel.signIn()
        if viewModel.isLoggedIn {
            mainManager.currentView = .main
            print("Перехожу на основной экран")
        } else {
            print("Неверный email или пароль")
            // Можно добавить отображение ошибки на экране
        }
    }
}
