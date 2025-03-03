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
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical){
                VStack {
                    
                    VStack {
                        Image("AddPlug")
                            .resizable() // Делает изображение масштабируемым
                            .frame(width: 91, height: 120)
                            .multilineTextAlignment(.leading)
                            .padding([.bottom, .top])
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topLeft, .topRight]))
                            
                            VStack(alignment: .center, spacing: geometry.size.height * 0.018) {
                                Text("Регистрация")
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 25))
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .background(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                                    .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                                    .frame(width: geometry.size.width, height: geometry.size.height * 0.08)
                                
                                SignUpFieldsView(geometry: geometry, user: $user, isValid: $isCorrectData)
                                
                                SignUpButton(geometry: geometry, mainManager: viewManager, isSignUp: $isCorrectData)
                                
                                HStack(spacing: 5) {
                                    Text("Уже есть аккаунт?")
                                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                        .multilineTextAlignment(.trailing)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding([.bottom, .top])
                                        .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
                                    
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
                        .frame(height: geometry.size.height * 0.8)
                    }
                    .frame(height: geometry.size.height * 0.7)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height) // Занимаем весь экран
            }
            .simultaneousGesture(DragGesture())            
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .edgesIgnoringSafeArea(.all) // Игнорируем безопасные области (если нужно)
    }
}

#Preview {
    SignUpView()
        .environmentObject(DataSource())
        .environmentObject(MainManager())
}
