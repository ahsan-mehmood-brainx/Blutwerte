//
//  UIColor.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 24/08/2023.
//

import UIKit

extension UIColor {
    
    static let astral = UIColor(hex: "#3176A7")
    static let whiteCustom = UIColor(hex: "#FFFFFF")
    static let blackCustom = UIColor(hex: "#000000")
    static let whiteLilac = UIColor(hex: "#F5F7FB")
    static let hoki = UIColor(hex: "#63839A")
    static let bayOfMany = UIColor(hex: "#205072")
    static let ghost = UIColor(hex: "#BDC2CD")
    static let paleSky = UIColor(hex: "#66727F")
    static let silverChalice = UIColor(hex: "#9D9D9D")
    static let periwinKleGray = UIColor(hex: "#C2D7E6")
    static let emperor = UIColor(hex: "#555151")
    static let mineShaft = UIColor(hex: "#3A3A3A")
    static let silver = UIColor(hex: "#BFBFBF")
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var sanitizedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if sanitizedHex.count == 6 {
            sanitizedHex = "FF" + sanitizedHex
        }
            
        var rgbValue: UInt64 = 0
        Scanner(string: sanitizedHex).scanHexInt64(&rgbValue)
            
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
            
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
