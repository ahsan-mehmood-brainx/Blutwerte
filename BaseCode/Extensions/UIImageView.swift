//
//  UIImageView.swift
//  Education Platform
//
//  Created by Thanh-Tam Le on 1/11/17.
//  Copyright © 2017 Duy Cao. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// height and width should be the same
    func roundImage() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
