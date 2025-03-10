//
//  Workout.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.03.2025.
//

import Foundation

struct Workout: Identifiable, CardRepresentable, Hashable {
    var id: Int
    var name: String
    var description: String
    var exercises: [Exercise] = []
//    var targetMuscles: [MuscleGroup] = []
    var createdBy: String
    var createdAt: String
    var cardType: CardType = .workout
}

