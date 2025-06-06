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
            switch viewManager.currentView {
            case .greetingQuestions:
                GreetingView()
                    .transition(.move(edge: .leading)) // Переход вправо (слева направо)
                    .environmentObject(dataSource)
                    .environmentObject(viewManager)
                
            case .signUp:
                SignUpView()
                    .transition(.move(edge: .trailing)) // Переход вправо
                    .environmentObject(dataSource)
                    .environmentObject(viewManager)
            case .signIn:
                SignInView()
                    .transition(.move(edge: .leading)) // Переход вправо
                    .environmentObject(dataSource)
                    .environmentObject(viewManager)
            case .main:
                PagesView()
                    .transition(.move(edge: .trailing)) // Переход вправо
                    .environmentObject(dataSource)
                    .environmentObject(viewManager)
                
            default:
                Text("Screen not found")
                    .foregroundColor(.red)
            }
        }
        .animation(.easeInOut, value: viewManager.currentView) // Плавная анимация при смене представлений
    }
}
