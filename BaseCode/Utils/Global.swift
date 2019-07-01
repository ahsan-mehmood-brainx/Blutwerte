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


