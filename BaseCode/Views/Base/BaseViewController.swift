//
//  BaseViewController.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import UIKit
import SwiftMessages

class BaseViewController: UIViewController {
    // MARK: - Instance Properties
    
    var toastView: MessageView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Private Methods
    
    private func setToastView() {
        toastView = MessageView.viewFromNib(layout: .cardView)
        toastView.iconImageView?.image = UIImage(systemName: Images.checkMarkFill)
        toastView.titleLabel?.text = LocalizedKey.success.string
        toastView.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        toastView.titleLabel?.textColor = .black
        toastView.bodyLabel?.font = .systemFont(ofSize: 12)
        toastView.bodyLabel?.textColor = .black
        toastView.iconLabel?.isHidden = true
        toastView.button?.setImage(UIImage(systemName: Images.crossMarkFill)?.withRenderingMode(.alwaysOriginal), for: .normal)
        toastView.button?.setTitle(AppConstants.empty, for: .normal)
        toastView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        (toastView.backgroundView as? CornerRoundingView)?.cornerRadius = 16
        toastView.configureDropShadow()
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
        let leftItem = UIBarButtonItem(image: UIImage(systemName: Images.crossMarkFill)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: action)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    func showToastView(withTitle title: String = LocalizedKey.success.string, withMessage message: String, okHandler: ((UIButton) -> Void)? = nil) {
        if toastView == nil {
            setToastView()
        }
        toastView.titleLabel?.text = title
        toastView.bodyLabel?.text = message
        toastView.buttonTapHandler = okHandler ?? { _ in
            Utils.after(30) {
                SwiftMessages.hide()
            }
        }
        SwiftMessages.show(view: toastView)
    }
    
    func setBackItem() {
        let backItem = UIBarButtonItem()
        backItem.title = AppConstants.empty
        navigationItem.backBarButtonItem = backItem
        navigationItem.backButtonTitle = AppConstants.empty
    }
}
