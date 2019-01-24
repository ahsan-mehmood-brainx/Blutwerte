//
//  ToastManager.swift
//  Give Savvy
//
//  Created by Hunain Shahid on 28/02/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation
import MBProgressHUD

class ToastManager {
    public static func showToastMessage(_ view: UIView, message: String) {
        let toast = MBProgressHUD.showAdded(to: view, animated: true)
        
        toast.mode = .text
        toast.label.text = message
        toast.removeFromSuperViewOnHide = true
        toast.bezelView.backgroundColor = UIColor.black
        toast.contentColor = UIColor.white
        
        toast.hide(animated: true, afterDelay: 2)
    }
}
