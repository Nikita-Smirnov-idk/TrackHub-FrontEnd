//
//  SignInView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.01.2025.
//

import SwiftUI

struct SignInView: View {
    let fields = SignInInfo().fields
    @EnvironmentObject var dataSource: DataSource
    @EnvironmentObject var viewManager: MainManager
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
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                .clipShape(CustomRoundedRectangle(cornerRadius: 45, corners: [.topLeft, .topRight]))
                            
                            VStack(alignment: .center, spacing: geometry.size.height * 0.018) {
                                Text("Вход в аккаунт")
                                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 25))
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .background(Color(dataSource.selectedTheme.secondaryBackgroundColor))
                                    .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                                    .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                                
                                VStack(spacing: geometry.size.height * 0.009) {
                                    ForEach(0..<fields.count, id: \.self) { index in
                                        if index == fields.count - 1 || index == fields.count - 2{
                                            SecurityFieldView(geometry: geometry, backgroundText: fields[index].fieldText, index: index)
                                        }
                                        else {
                                            TextFieldView(geometry: geometry, backgroundText: fields[index].fieldText, index: index)
                                        }
                                    }
                                }
                                Button(action: {print("SignIn")}){
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
                                                .fill(Color(dataSource.selectedTheme.primaryColor)))
                                        .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
                                }
                                
                                HStack(spacing: 5) {
                                    Text("Нет аккаунта?")
                                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                        .multilineTextAlignment(.trailing)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding([.bottom, .top])
                                        .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
                                    
                                    Text("Создать")
                                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding([.bottom, .top])
                                        .foregroundStyle(Color(dataSource.selectedTheme.primaryColor))
                                        .onTapGesture {
                                            viewManager.currentView = .signUp
                                        }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

                        }
                        .frame(height: geometry.size.height * 0.7)
                    }
                    
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
    SignInView().environmentObject(DataSource())
}

