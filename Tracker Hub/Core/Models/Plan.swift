//
//  Plan.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.03.2025.
//

import Foundation

struct Plan: Identifiable, CardRepresentable {
    var id: Int
    var name: String
    var description: String
    var schedule: [DayOfWeek: [Workout]] = [:]
    var createdBy: String
    var createdAt: String
    var cardType: CardType = .plan
}
