//
//  Tracker_HubApp.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 28.11.2024.
//

import SwiftUI

@main
struct Tracker_HubApp: App {
    
    init() {
        // Меняем цвет у всех окон сцены
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            for window in windowScene.windows {
                window.backgroundColor = UIColor.darkGray
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
//            ProfileView(plugUser: PlugUser(email: "arem379@mail.ru", password: "", phoneNumber: "+79143783306", isMale: true, isTrener: true, avatar: "plugImage", name: "Роман", surname: "Николаев", notifications: ["Поздравляю! Вы выиграли билет на качественную порку!"], rating: 4.89)).environmentObject(DataSource())
            
//            PagesView().environmentObject(DataSource())
            CurrentView()
        }
    }
}
