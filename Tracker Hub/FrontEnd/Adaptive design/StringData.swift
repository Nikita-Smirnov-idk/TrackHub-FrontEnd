//
//  String_data.swift
//  Tracker Hub
//
//  Created by Никита Смирнов on 30.11.2024.
//

import UIKit
import SwiftUI


/// Set size to Font that is main in app and return it
/// - Parameter value: font size
/// - Returns: font with the difinite size
func SetSizeToMainFont(_ value: CGFloat) -> UIFont? {
    return UIFont(name: Fonts.ReadexPro_Bold.rawValue, size: value)
}

/// Find the longest string in list
/// - Parameter list: list of strings
/// - Returns: the longest string in list
func GetMaxLengthElement(_ list: [String]) -> String {
    if (list.count != 0)
    {
        let max_el = list.max(by: ({$1.count > $0.count})) ?? "";
        return max_el
    }
    return ""
}

extension String {

    /// Count the length of string in difinite font
    /// - Parameter font: font
    /// - Returns: the length of new string
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    
    /// Count the height of string in difinite font
    /// - Parameter font: font
    /// - Returns: the height of new string
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    /// Count the size of string in difinite font
    /// - Parameter font: font
    /// - Returns: the size of new string
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

/// All custom fonts added to app
enum Fonts: String {
    case ReadexPro = "ReadexPro"
    case ReadexPro_Bold = "ReadexPro-Bold"
    case ReadexPro_ExtraLight = "ReadexPro-ExtraLight"
    case ReadexPro_Light = "ReadexPro-Light"
    case ReadexPro_Medium = "ReadexPro-Medium"
    case ReadexPro_Regular = "ReadexPro-Regular"
    case ReadexPro_SemiBold = "ReadexPro-SemiBold"
}

