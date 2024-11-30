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
