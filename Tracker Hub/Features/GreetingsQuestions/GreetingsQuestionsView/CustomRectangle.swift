//
//  CustomRectangle.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 29.11.2024.
//

import SwiftUI


/// Rectangle, with option of setting corner radiuses
struct CustomRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
}
