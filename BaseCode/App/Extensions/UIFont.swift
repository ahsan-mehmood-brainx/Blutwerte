//
//  UIFont.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

extension UIFont.Weight {

    var name: String {
        switch self {
        case .black:
            return "Black"
        case .bold:
            return "Bold"
        case .heavy:
            return "Heavy"
        case .semibold:
            return "SemiBold"
        case .medium:
            return "Medium"
        case .regular:
            return "Regular"
        case .thin:
            return "Thin"
        case .light:
            return "Light"
        case .ultraLight:
            return "UltraLight"
        default:
            return ""

        }
    }
}

extension UIFont {

    static func current(withWeight weight: Weight, andSize size: CGFloat) -> UIFont {
        let fontName = "\(Config.fontFamily)-\(weight.name)"
        return UIFont(name: fontName, size: size)!
    }
    
    static func sfProText(withWeight weight: Weight, andSize size: CGFloat) -> UIFont {
        let fontName = "\(Config.sfProText)-\(weight.name)"
        return UIFont(name: fontName, size: size)!
    }
    
    static func sfProDisplay(withWeight weight: Weight, andSize size: CGFloat) -> UIFont {
        let fontName = "\(Config.sfProDisplay)-\(weight.name)"
        return UIFont(name: fontName, size: size)!
    }
}
