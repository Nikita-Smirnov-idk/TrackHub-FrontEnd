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
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height



/// Function that allows to get relative to size of device font size (huge difference between iphone and ipad)
/// - Parameter value: font size
/// - Returns: new font size, that depends on size of device
func RelativeFontSize(_ value: CGFloat) -> CGFloat{
    let scaleFactor = screenWidth / 375
    return ((atan(scaleFactor*5) + 1.4)/2.6) *  scaleFactor * value
}


/// Function that allows to get relative to size of device font size (medium difference between iphone and ipad)
/// When the size of device is bigger than a constant number - the size of font stops growing
/// - Parameters:
///   - size: font size
///   - func_coef: coefficient that is used to multiply the value in the function
///   - plus_value: shift to the left of the function
///   - divider_value: value which will be used for division (for decreasing the final value)
/// - Returns: new font size, that depends on size of device
func RelativeFontSize(size: CGFloat, func_coef: CGFloat, plus_value: CGFloat, divider_value: CGFloat) -> CGFloat{
    let scaleFactor = screenWidth / 375
    return ((atan(scaleFactor*func_coef) + plus_value)/divider_value) *  scaleFactor * size
}


/// Function that allows to get relative to size of device font size (medium difference between iphone and ipad)
/// When the size of device is bigger than a constant number - the size of font stops growing
/// The range of coefficient for function will depend on params
/// - Parameters:
///   - size: font size
///   - func_coef: coefficient that is used to multiply the value in the function
///   - plus_value: shift to the left of the function
///   - divider_value: value which will be used for division (for decreasing the final value)
/// - Returns: new font size, that depends on size of device
func RelativeFontSizeType2(size: CGFloat, func_coef: CGFloat, plus_value: CGFloat, divider_value: CGFloat) -> CGFloat{
    let scaleFactor = screenWidth / 375
    return ((atan(scaleFactor*func_coef) + plus_value)/divider_value) * size
}

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

func AdaptiveValue(idealValue: CGFloat, minValue: CGFloat, maxValue: CGFloat) -> CGFloat {
    return min(max(idealValue, minValue), maxValue)
}
