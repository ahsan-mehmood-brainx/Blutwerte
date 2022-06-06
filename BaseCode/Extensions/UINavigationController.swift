//
//  UINavigationController.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import UIKit

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
}
