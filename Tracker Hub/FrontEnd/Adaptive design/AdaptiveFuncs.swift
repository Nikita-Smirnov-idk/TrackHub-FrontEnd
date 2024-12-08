//
//  adaptive_funcs.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 30.11.2024.
//

import UIKit
import SwiftUI

let main_width = 393.0
let main_height = 852.0

func scaleScreen_x(_ value : CGFloat) -> CGFloat{
    let coefficient = value/main_width
    let new_val = coefficient * UIScreen.main.bounds.width
    return new_val
}

func scaleScreen_y(_ value : CGFloat) -> CGFloat{
    let coefficient = value/main_height
    let new_val = coefficient * UIScreen.main.bounds.height
    return new_val
}

import UIKit

struct FontManager {
    // deviceWidthSize == Your default screen width. For example, if your designer created a design using iPhone 11,
    // then the size will be the width of iPhone 11 and so on. Therefore, you should adjust it according to your designed screens.
    static let deviceWidthSize = 414.0

    // Adjust factor for iPad consideration
    static private let adjustFactorWithConsiderationOfIpad = UIScreen.main.traitCollection.userInterfaceIdiom == .pad ? 0.65 : 1

    static let scaleFactorWidth: CGFloat = (UIScreen.main.bounds.width / FontManager.deviceWidthSize) * CGFloat(adjustFactorWithConsiderationOfIpad)
}
