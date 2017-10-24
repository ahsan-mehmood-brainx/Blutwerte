//
//  Global.swift
//  Signature
//
//  Created by Thanh-Tam Le on 9/23/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CoreLocation

class Global {
    
    static let colorMain = UIColor(0xEEF8FF)
    static let colorSecond = UIColor(0x33B476)
    static let colorSelected = UIColor(0x434F5D)
    static let colorBg = UIColor(0xF9F9F9)
    static let colorSeparator = UIColor(0xE6E7E8)
    static let colorStatus = UIColor(0x333333)
    static let colorGray = UIColor(0xAEB5B8)
    static let colorGreen = UIColor(0x19A900)
    static let colorLightGreen = UIColor(0x99CC33)
    static let colorBlue = UIColor(0xAAC3FD)
    static let colorPurple = UIColor(0x040055)
    static let colorTextField = UIColor(0xCFE6E5)
    static let colorNegative = UIColor(0x950034)
    static let colorPositive = UIColor(0x99CC33)
    static let colorNagativeMoney = UIColor(0xCF3900)
    static let colorPositiveMoney = UIColor(0x19A900)
    static let colorBudgetHint = UIColor(0x7BA2AC)

    static let imageSize = CGSize(width: 1024, height: 768)
    
    static var SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static var SCREEN_HEIGHT = UIScreen.main.bounds.size.height

    
    // Font
    static func boldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Heavy", size: size)!
    }
    
    static func lightFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Book", size: size)!
    }
    
    static func mediumFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Futura-Medium", size: size)!
    }
    
    static func italicFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-BookObl", size: size)!
    }
    
    /*
     == Futura-CondensedMedium
     == Futura-CondensedExtraBold
     == Futura-Medium
     == Futura-MediumItalic
     == Futura-Bold
     
     Futura PT
     == FuturaPT-Heavy
     == FuturaPT-BookObl
     == FuturaPT-Book
     */
}


struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    
    static let IS_IPHONE  = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD    = UIDevice.current.userInterfaceIdiom == .pad
}


