//
//  QuestionsManager.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.01.2025.
//

import SwiftUI

class GreetingManager: ObservableObject {
    @Published var isTrainer: Bool = false
    @Published var isFirstQuestionShown: Bool = true
}
