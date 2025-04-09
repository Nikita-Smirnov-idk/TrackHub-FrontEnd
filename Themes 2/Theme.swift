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
    var secondaryBackgroundColor: UIColor { get }
    var buttonsBackgroundColor: UIColor { get }
    var secondaryFontColor: UIColor { get }
    var subFontColor: UIColor { get }
    var themeName: String { get }
}
