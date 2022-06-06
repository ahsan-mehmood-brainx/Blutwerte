//
//  UIFont.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    /// how to add you custom fonts, visit https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app
    static func yourFontRegular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "You Font Name", size: size)
    }
}
