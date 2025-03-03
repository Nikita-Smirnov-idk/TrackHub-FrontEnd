//
//  QuestionsView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.01.2025.
//

import SwiftUI

struct GreetingView: View {
    @StateObject var viewModel = GreetingManager()
    @StateObject var dataSource = DataSource()
    @EnvironmentObject var viewManager: MainManager

    var body: some View {
        ZStack {
            if viewModel.isFirstQuestionShown {
                FirstQuestionView()
                    .transition(.move(edge: .leading)) // Переход вправо
                    .environmentObject(viewModel)
                    .environmentObject(dataSource)
            } else {
                QuestionViewModel()
                    .transition(.move(edge: .trailing)) // Переход вправо
                    .environmentObject(dataSource)
                    .environmentObject(viewModel)
            }
        }
        .animation(.easeInOut, value: viewModel.isFirstQuestionShown) // Плавная анимация при изменении
    }
}


#Preview {
    GreetingView()
        .environmentObject(DataSource())
        .environmentObject(MainManager())
}
