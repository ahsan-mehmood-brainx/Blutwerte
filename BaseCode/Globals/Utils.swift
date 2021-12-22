//
//  Utils.swift
//  BaseCode
//
//  Created by BrainX Technologies on 01/07/2019.
//  Copyright © 2019 Brainx Technologies. All rights reserved.
//

import UIKit
import SystemConfiguration
import UserNotifications

class Utils {
    
    static func showOkAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showActionAlert(title: String, message: String, viewController: UIViewController, alertActions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
}
