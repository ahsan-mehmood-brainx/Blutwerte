//
//  UIButton.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import UIKit

extension UIButton {
    func setButton(_ title: String, bgColor: UIColor, textColor: UIColor = .black, borderColor: UIColor? = nil, cornerRadius: CGFloat = 12, font: UIFont = UIFont.systemFont(ofSize: 16)) {
        if let borderColor = borderColor {
            makeRoundCornersWithBorder(cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: 1)
        } else {
            makeRoundCorners(cornerRadius: cornerRadius)
        }
        backgroundColor = bgColor
        setTitle(title, for: .normal)
        titleLabel?.font = font
        tintColor = textColor
    }
    
    func setButtonWithBorder(_ title: String, bgColor: UIColor, textColor: UIColor = .black, borderColor: UIColor, borderWidth: CGFloat = 1) {
        makeRoundCornersWithBorder(cornerRadius: 12, borderColor: borderColor, borderWidth: borderWidth)
        backgroundColor = bgColor
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16)
        tintColor = textColor
    }
}
