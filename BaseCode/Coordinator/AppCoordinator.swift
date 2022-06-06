//
//  AppCoordinator.swift
//  Cord
//
//  Created by Kanan Abilzada on 02.07.21.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let viewController = ViewController.instantiate(from: .main)
        self.navigationController.viewControllers = [viewController]
        window.rootViewController =  self.navigationController
        window.makeKeyAndVisible()
    }
}


