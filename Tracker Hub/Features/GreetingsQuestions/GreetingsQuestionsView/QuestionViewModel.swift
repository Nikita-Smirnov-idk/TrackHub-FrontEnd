//
//  QuestionViewModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.01.2025.
//

import SwiftUI

struct QuestionViewModel: View {
//    let pages: [QuestionData] = [
//        QuestionData(text:  "Какова ваша цель?", answers: ["Увеличить доход", "Упростить работу", "Найти новых клиентов"]),
//        QuestionData(text: "Вы только начинаете свою карьеру?", answers: ["Да", "Нет"]),
//        QuestionData(text: "Вы хотите видеть подсказки?", answers:  ["Да", "Нет"]),
//        QuestionData(text: "Благодарим вас! Желаем приятного пользования нашим приложение", answers: [])
//    ]
    
    @EnvironmentObject var dataSource: DataSource
    @EnvironmentObject var manager: GreetingManager
    @EnvironmentObject var viewManager: MainManager
    @State private var selectedPage = 0
    
    var pages: [QuestionData] {
            if !manager.isTrainer {
                return ClientQuestions().pages
            } else {
                return TrainerQuestions().pages
            }
    }
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    ForEach(0..<pages.count) { i in
                        Rectangle()
                            .fill(selectedPage == i ? Color(dataSource.selectedTheme.primaryColor) : Color(dataSource.selectedTheme.secondaryBackgroundColor))
                            .frame(height: 5)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(30)
                            .animation(.easeInOut, value: selectedPage)
                    }
                }
                .padding()
                
                HStack {
                    Button(action: {
                        if selectedPage > 0
                        {
                            selectedPage -= 1
                        }
                        else{
                            manager.isFirstQuestionShown = true
                        }
                    }){
                        Text("Back")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                    }
                    .padding()
                    .disabled(selectedPage < 0)
                    
                    Spacer()
                    
                    Button(action: {
                        if selectedPage < pages.count - 1 {
                            selectedPage += 1
                        } else if selectedPage == pages.count - 1 {
                            viewManager.currentView = .signUp
                        }
                    }) {
                        Text("Skip")
                            .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                            .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                    }
                    .padding()
                    .disabled(selectedPage > pages.count - 1)

                }
                
                TabView (selection: $selectedPage) {
                    ForEach(0..<pages.count) { i in
                        QuestionView(page: pages[i], selectedPages: $selectedPage)
                            .tag(i)
                    }
                }
                .tabViewStyle(DefaultTabViewStyle())
                .animation(.linear, value: selectedPage)
            }
        }
        .background(Color(dataSource.selectedTheme.backgroundColor))
        .dynamicTypeSize(.large...DynamicTypeSize.accessibility2)

    }
}

#Preview {
    QuestionViewModel()
        .environmentObject(DataSource())
        .environmentObject(GreetingManager())
}
