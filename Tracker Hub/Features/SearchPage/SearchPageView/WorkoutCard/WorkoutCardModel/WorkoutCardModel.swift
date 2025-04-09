//
//  WorkoutCardModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 03.03.2025.
//

import Foundation

struct WorkoutCardModel : Identifiable, Hashable{
    var id: Int = 0
    var name: String
    var description: String
    var category: String = ""
    var isPublic: Bool = true
    var isWorkout: Bool
    var sharedWith: [String] = []
    var createdBy: String
    var createdAt: String
}
