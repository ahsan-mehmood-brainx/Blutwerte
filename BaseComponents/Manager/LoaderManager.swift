//
//  LoaderManager.swift
//  Give Savvy
//
//  Created by Hunain Shahid on 31/01/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation
import MBProgressHUD

class LoaderManager {
    
    public static func show(_ view: UIView, message: String? = nil) {
        let loader = MBProgressHUD.showAdded(to: view, animated: true)
        loader.mode = .indeterminate
        loader.bezelView.backgroundColor = UIColor.black
        if let message = message {
            loader.label.text = message
        }
        loader.contentColor = UIColor.white
    }
    
    public static func hide(_ view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
