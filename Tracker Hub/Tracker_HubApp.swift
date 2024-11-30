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
            ContentView().environmentObject(DataSource())
        }
    }
}
