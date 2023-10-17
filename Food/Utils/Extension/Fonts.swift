//
//  Fonts.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import SwiftUI

enum InterFonts: String {
    case black = "Inter-Black"
    case bold = "Inter-Bold"
    case extraBold = "Inter-ExtraBold"
    case extraLight = "Inter-ExtraLight"
    case medium = "Inter-Medium"
    case regular = "Inter-Regular"
    case semiBold = "Inter-SemiBold"
    case thin = "Inter-Thin"
}

extension Font {
    static func inter(_ interFont: InterFonts, size: CGFloat) -> Font{
        return .custom(interFont.rawValue, size: size)
    }
}
