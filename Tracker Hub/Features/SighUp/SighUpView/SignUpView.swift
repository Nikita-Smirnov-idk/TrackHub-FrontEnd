//
//  SignUpView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 19.01.2025.
//
import SwiftUI

struct SignUpView: View {
    let fields = SignUpInfo().fields
    
    @State private var keyboardHeight: CGFloat = 0
    @State private var isOn: Bool = false
    @State private var isCorrectData: Bool = false
    @EnvironmentObject var dataSource: DataSource
    @EnvironmentObject var viewManager: MainManager
    
    @State var user = SignUpUserModel()
    @State private var isPressed = false // Состояние для анимации

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Верхний слой: логотип кенгуру
                VStack {
                    Image("LogoType")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .scaleEffect(isPressed ? 0.9 : 1.0) // Масштабирование логотипа
                        .colorMultiply(isPressed ? Color(dataSource.selectedTheme.primaryColor) : .white) // Изменение цвета логотипа
                        .animation(.easeInOut(duration: 0.2), value: isPressed) // Анимация
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    isPressed.toggle() // Переключаем состояние
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        isPressed.toggle() // Возвращаем состояние обратно через 0.2 секунды
                                    }
                                }
                        )
                        .padding(.top, 100)

                    Text("TrackHub")
                        .font(.custom(Fonts.ReadexPro_Bold.rawValue, size: isPressed ? 26 : 24)) // Жирный шрифт, размер меняется при нажатии
                        .foregroundColor(.white) // Основной цвет текста
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(dataSource.selectedTheme.primaryColor),
                                    Color(dataSource.selectedTheme.secondaryFontColor)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .mask(Text("TrackHub").font(.custom(Fonts.ReadexPro_Bold.rawValue, size: isPressed ? 26 : 24)))
                        )
                        .shadow(
                            color: isPressed ? Color(dataSource.selectedTheme.primaryColor).opacity(0.8) : Color(dataSource.selectedTheme.primaryColor).opacity(0.5),
                            radius: isPressed ? 10 : 5, // Тень становится больше при нажатии
                            x: 0,
                            y: isPressed ? 4 : 2
                        )
                        .scaleEffect(isPressed ? 1.05 : 1.0) // Текст немного увеличивается при нажатии
                        .animation(.easeInOut(duration: 0.2), value: isPressed) // Анимация текста
                        .padding(.top, 8)
                    
                    Spacer() // Растягиваем пространство, чтобы логотип был сверху
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color(dataSource.selectedTheme.backgroundColor)) // Фон нижнего слоя

                // Верхний слой: форма регистрации
                ScrollView(.vertical, showsIndicators: false) { // Убираем индикатор прокрутки
                    VStack(spacing: 0) {
                        Spacer(minLength: geometry.size.height * 0.5) // Отступ сверху для скрытия логотипа

                        // Форма регистрации
                        ZStack {
                            Rectangle()
                                .fill(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                                .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topLeft, .topRight]))
                            
                            VStack(alignment: .center, spacing: geometry.size.height * 0.018) {
                                Text("Регистрация")
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 25))
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.clear)
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(dataSource.selectedTheme.primaryColor),
                                                Color(dataSource.selectedTheme.secondaryFontColor)
                                            ]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                        .mask(Text("Регистрация")
                                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 25))
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                        )
                                    )
                                    .shadow(
                                        color: Color(dataSource.selectedTheme.primaryColor).opacity(isPressed ? 0.5 : 0.3),
                                        radius: isPressed ? 8 : 5,
                                        x: 0,
                                        y: isPressed ? 5 : 3
                                    )
                                    .scaleEffect(isPressed ? 1.05 : 1.0)
                                    .animation(.easeInOut(duration: 0.2), value: isPressed)
                                    .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                                    .gesture(
                                        TapGesture()
                                            .onEnded {
                                                isPressed.toggle()
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                    isPressed.toggle()
                                                }
                                            }
                                    )

                                // Поля для регистрации
                                SignUpFieldsView(geometry: geometry, user: $user, isValid: $isCorrectData)

                                // Кнопка "Зарегистрироваться"
                                SignUpButton(geometry: geometry, mainManager: viewManager, isSignUp: $isCorrectData)

                                // Ссылка на вход
                                HStack(spacing: 5) {
                                    Text("Уже есть аккаунт?")
                                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                        .multilineTextAlignment(.trailing)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding([.bottom, .top])
                                        .foregroundStyle(Color(dataSource.selectedTheme.secondaryFontColor))
                                    
                                    Text("Войти")
                                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding([.bottom, .top])
                                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                                        .onTapGesture {
                                            viewManager.currentView = .signIn
                                        }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        }
                        .frame(height: geometry.size.height * 0.7)

                        // Добавляем дополнительный прямоугольник для плавного перехода
                        Rectangle()
                            .fill(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                            .frame(height: geometry.size.height * 0.2) // Высота дополнительного пространства
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 1.2) // Увеличиваем высоту контента
                }
                .background(Color.clear) // Прозрачный фон для ScrollView
            }
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .edgesIgnoringSafeArea(.all) // Игнорируем безопасные области
    }
}

#Preview {
    SignUpView()
        .environmentObject(DataSource())
        .environmentObject(MainManager())
}
