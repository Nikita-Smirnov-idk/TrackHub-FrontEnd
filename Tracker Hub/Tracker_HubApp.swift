//
//  Tracker_HubApp.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 28.11.2024.
//

import SwiftUI

@main
struct Tracker_HubApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileView(plugUser: PlugUser(email: "", password: "", isTrener: true, avatar: "", name: "Роман", surname: "Николаев", notifications: ["Поздравляю! Вы выиграли билет на качественную порку!"], rating: 4.89)).environmentObject(DataSource())
        }
    }
}
