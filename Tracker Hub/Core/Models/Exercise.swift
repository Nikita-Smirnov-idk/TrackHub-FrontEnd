//
//  Exercise.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.03.2025.
//

import Foundation

struct Exercise: Identifiable, Hashable {
    var id: Int = 0
    var name: String
    var sets: Int
    var reps: Int
    var restTime: Int
}
