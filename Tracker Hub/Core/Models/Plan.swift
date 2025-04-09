//
//  Plan.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.03.2025.
//

import Foundation

struct Plan: Identifiable, CardRepresentable, Hashable, Codable {
    var id: Int
    var name: String
    var description: String
    var schedule: [DayOfWeek: [Workout]] = [:]
    var createdBy: User
    var createdAt: String
    var cardType: CardType = .plan
}
