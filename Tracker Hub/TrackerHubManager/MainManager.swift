//
//  MainManager.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 20.01.2025.
//

import SwiftUI

class MainManager: ObservableObject {
    @Published var currentView: ViewType = .greetingQuestions
}

enum ViewType {
    case signUp
    case signIn
    case main
    case greetingQuestions
}
