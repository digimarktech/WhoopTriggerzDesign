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
    static private func custom(_ font: LatoFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
    /// h1
    static func h1() -> SwiftUI.Font {
        SwiftUI.Font.custom(.black, size: 24)
    }
    /// h2 Black
    static func h2Black() -> SwiftUI.Font {
        SwiftUI.Font.custom(.black, size: 16)
    }
    /// h2 Regular
    static func h2Regular() -> SwiftUI.Font {
        SwiftUI.Font.custom(.regular, size: 16)
    }
    /// h3
    static func h3() -> SwiftUI.Font {
        SwiftUI.Font.custom(.black, size: 16)
    }
    /// Body 1
    static func body1() -> SwiftUI.Font {
        SwiftUI.Font.custom(.regular, size: 24)
    }
    /// Body 2
    static func body2() -> SwiftUI.Font {
        SwiftUI.Font.custom(.regular, size: 14)
    }
    /// Body 3 Bold
    static func body3Bold() -> SwiftUI.Font {
        SwiftUI.Font.custom(.bold, size: 12)
    }
    /// Body 3 Regular
    static func body3Regular() -> SwiftUI.Font {
        SwiftUI.Font.custom(.regular, size: 12)
    }
    /// Button Text
    static func buttonText() -> SwiftUI.Font {
        SwiftUI.Font.custom(.regular, size: 20)
    }
    /// Small Text Black
    static func smallTextBlack() -> SwiftUI.Font {
        SwiftUI.Font.custom(.black, size: 10)
    }
    /// Small Text Regular
    static func smallTextRegular() -> SwiftUI.Font {
        SwiftUI.Font.custom(.regular, size: 10)
    }
    /// Big Text Black
    static func bigTextBlack() -> SwiftUI.Font {
        SwiftUI.Font.custom(.black, size: 40)
    }
    /// Big Text Regular
    static func bigTextRegular() -> SwiftUI.Font {
        SwiftUI.Font.custom(.regular, size: 40)
    }
}
