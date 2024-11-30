//
//  Theme.swift
//  XO_AI
//
//  Created by Никита Смирнов on 28.11.2024.
//

import UIKit

protocol Theme {
    var primaryColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var secondBackgroundColor: UIColor { get }
    var themeName: String { get }
}
