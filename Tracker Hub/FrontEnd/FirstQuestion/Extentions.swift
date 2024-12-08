//
//  Extentions.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 30.11.2024.
//

import SwiftUI

extension Color {
     init(hex: String) {
         let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
         let scanner = Scanner(string: hexSanitized)
         scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
         
         var rgb: UInt64 = 0
         scanner.scanHexInt64(&rgb)
         
         let red = Double((rgb & 0xFF0000) >> 16) / 255.0
         let green = Double((rgb & 0x00FF00) >> 8) / 255.0
         let blue = Double(rgb & 0x0000FF) / 255.0
         
         self.init(red: red, green: green, blue: blue)
     }
 }

