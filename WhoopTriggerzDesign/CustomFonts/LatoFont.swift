//
//  LatoFont.swift
//  WhoopTriggerzDesign
//
//  Created by Dan Aupont on 5/22/23.
//

import Foundation
import SwiftUI

enum LatoFont: String {
    case black = "Lato-Black"
    case blackItalic = "Lato-BlackItalic"
    case bold = "Lato-Bold"
    case boldItalic = "Lato-BoldItalic"
    case italic = "Lato-Italic"
    case light = "Lato-Light"
    case lightItalic = "Lato-LightItalic"
    case regular = "Lato-Regular"
    case thin = "Lato-Thin"
    case thinItalic = "Lato-ThinItalic"
}

extension Font {
    static func custom(_ font: LatoFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
