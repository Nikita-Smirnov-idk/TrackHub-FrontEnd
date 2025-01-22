//
//  CoachPlug.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.01.2025.
//

import SwiftUI

enum WorkoutTypes{
    case workout
    case cardio
    case flexbility
    case balancedWorlouts
    case martialArts
}

struct Coach {
    let name: String
    let category: [WorkoutTypes]
    let experiance: Int
    let rating: Double
    let reviesCount: Int
    let price: Int
    let iconName: String
}

struct CoachTable {
    static let coachTable: [Coach] = [
        Coach(
            name: "Владислав Григоренко",
            category: [.workout],
            experiance: 5,
            rating: 4.8,
            reviesCount: 36,
            price: 1500,
            iconName: "Coach1"
        ),
        
        Coach(
            name: "Максим Куликов",
            category: [.workout],
            experiance: 6,
            rating: 4.1,
            reviesCount: 30,
            price: 2000,
            iconName: "Coach2"
        ),
        
        Coach(
            name: "Григорий Леоньев",
            category: [.workout],
            experiance: 3,
            rating: 3.2,
            reviesCount: 12,
            price: 1000,
            iconName: "Coach3"
        )
    ]
}
