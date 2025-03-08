//
//  DayOfWeek.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 05.03.2025.
//

import SwiftUI

enum DayOfWeek: String, CaseIterable, Identifiable {
    case monday = "ПН"
    case tuesday = "ВТ"
    case wednesday = "СР"
    case thursday = "ЧТ"
    case friday = "ПТ"
    case saturday = "СБ"
    case sunday = "ВС"

    var id: String { self.rawValue }
}

