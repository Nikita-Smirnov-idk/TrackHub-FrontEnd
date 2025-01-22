//
//  CurrentView.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.01.2025.
//

import SwiftUI

struct CurrentView: View {
    @StateObject var viewManager = MainManager()
    @StateObject var dataSource = DataSource()
    
    var body: some View {
        ZStack {
            if viewManager.currentView == .greetingQuestions {
                GreetingView()
                    .transition(.move(edge: .leading)) // Переход вправо (слева направо)
                    .environmentObject(dataSource)
                    .environmentObject(viewManager)
            } else if viewManager.currentView == .signUp {
                SignUpView()
                    .transition(.move(edge: .leading)) // Переход вправо
                    .environmentObject(dataSource)
                    .environmentObject(viewManager)
            } else if viewManager.currentView == .signIn {
                SignInView()
                    .transition(.move(edge: .trailing)) // Переход вправо
                    .environmentObject(dataSource)
                    .environmentObject(viewManager)
            }
        }
        .animation(.easeInOut, value: viewManager.currentView) // Плавная анимация при смене представлений
    }
}
