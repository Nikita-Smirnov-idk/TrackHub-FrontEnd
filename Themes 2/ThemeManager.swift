//
//  ThemeManager.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 28.11.2024.
//

import Foundation

enum ThemeManager {
    static let themes: [Theme] = [Theme1(),]
    
    func getTheme(_ theme: Int)-> Theme
    {
        Self.themes[theme]
    }
}
