//
//  CardModel.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 06.03.2025.
//

import Foundation

struct CardModel: Identifiable {
    var id: Int
    var name: String
    var description: String
    var createdAt: String
    var createdBy: String
    var cardType: CardType
    
    init<T: CardRepresentable>(from item: T, cardType: CardType) {
        self.id = item.id
        self.name = item.name
        self.description = item.description
        self.createdAt = item.createdAt
        self.createdBy = item.createdBy
        self.cardType = cardType
    }
}
