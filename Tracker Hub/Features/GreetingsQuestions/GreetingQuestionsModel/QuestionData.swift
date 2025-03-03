//
//  QuestionData.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 18.01.2025.
//

import SwiftUI

struct QuestionData: Identifiable {
    var id: UUID = UUID()
    var text: String
    var answers: [String]
}
