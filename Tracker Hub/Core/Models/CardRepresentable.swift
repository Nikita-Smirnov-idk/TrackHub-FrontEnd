//
//  CardRepresentable.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 06.03.2025.
//

import Foundation

protocol CardRepresentable: Identifiable, Hashable, Codable{
    var id: Int { get }
    var name: String { get }
    var description: String { get }
    var createdAt: String { get }
    var createdBy: User { get }
    var cardType: CardType { get }
}
