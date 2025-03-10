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
    @Binding var showAlert: Bool
    var signInUserData: SignInUserModel  // добавляем недостающее свойство
    var signUpUserData: SignUpUserModel

    @State private var isPressed = false // Состояние для анимации нажатия
    @ObservedObject var signInViewModel: SignInViewModel
    @ObservedObject var signUpViewModel: SignUpViewModel
    

    init(geometry: GeometryProxy,
         mainManager: MainManager,
         isSignUp: Binding<Bool>,
         showAlert: Binding<Bool>,
         signInUserData: SignInUserModel,
         signUpUserData: SignUpUserModel) {
        self.geometry = geometry
        self.mainManager = mainManager
        self._isSignUp = isSignUp
        self._showAlert = showAlert
        self.signInUserData = signInUserData
        self.signUpUserData = signUpUserData
        self.signInViewModel = SignInViewModel(userData: signInUserData)
        self.signUpViewModel = SignUpViewModel(userData: signUpUserData)
    }
    
    var body: some View {
        Button(action: {
            isPressed = true // Анимация нажатия
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPressed = false // Возвращаем состояние обратно
                buttonAction() // Выполняем действие кнопки
            }
        }) {
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
        .disabled(!isSignUp)
        .opacity(isSignUp ? 1.0 : 0.6)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Регистрация"),
                message: Text("На ваш email отправлена ссылка для подтверждения."),
                dismissButton: .default(Text("Окей"), action: {
                   // Переход на основной экран выполняется только после нажатия "Окей"
                   mainManager.currentView = .main
               })
            )
        }// Прозрачность, если кнопка неактивна
    }

    private func buttonAction() {
        showAlert.toggle()
        
        signUpViewModel.signUp()
        
        print("email: \(signUpUserData.email), password: \(signUpUserData.password)")

        print("email: \(signInUserData.email), password: \(signInUserData.password)")
        
        if signUpViewModel.isLoggedIn {
            print("Регистрация прошла успешно")
        }
        else{
            print("Не получается зарегаться")
        }
        
        signInViewModel.signIn()
        
        if signInViewModel.isLoggedIn {
            print("Перехожу на основной экран")
        } else {
            print("Неверный email или пароль")
            // Можно добавить отображение ошибки на экране
        }
    }
}
