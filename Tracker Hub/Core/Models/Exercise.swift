//
//  Exercise.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.03.2025.
//

import Foundation

struct Exercise: Identifiable, Hashable, CardRepresentable, Codable {
    var id: Int = 0
    var name: String
    var description: String
    var targetMuscle: [String]
    var gymEquipment: [String]
    var instructions: [String]
    var preview: String
    var vidoe: String
    var sets: Int
    var reps: Int
    var restTime: Int
    var createdAt: String
    var createdBy: User
    var cardType: CardType = .exercise
}

