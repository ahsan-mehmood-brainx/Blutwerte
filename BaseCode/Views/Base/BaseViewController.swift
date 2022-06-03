//
//  BaseViewController.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Public Methods
    
    func hideNavigationBar(_ hide: Bool) {
        navigationController?.setNavigationBarHidden(hide, animated: true)
    }
    
    func showLoader(_ show: Bool) {
        show ? LoaderManager.show(view) : LoaderManager.hide(view)
    }
    
    func showAlertView(withTitle title: String = LocalizedKey.error.string, withMessage message: String, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: LocalizedKey.ok.string, style: .default, handler: okHandler)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func addCrossLeftBarItem(_ action: Selector) {
        let leftItem = UIBarButtonItem(image: UIImage.crossMarkFill?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: action)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    func setBackItem() {
        let backItem = UIBarButtonItem()
        backItem.title = AppConstants.empty
        navigationItem.backBarButtonItem = backItem
        navigationItem.backButtonTitle = AppConstants.empty
    }
}
