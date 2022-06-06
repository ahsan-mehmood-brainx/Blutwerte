//
//  UITableViewCell.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reusableIdentifier: String {
        String(describing: self)
    }
}
