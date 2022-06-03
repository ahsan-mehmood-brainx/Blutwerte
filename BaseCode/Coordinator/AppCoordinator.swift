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
        let viewController = ViewController.instantiate(from: .main)
        self.navigationController  = UINavigationController(rootViewController: viewController)
        window.rootViewController =  self.navigationController
    }
    
    func start() {
        window.makeKeyAndVisible()
    }
}


