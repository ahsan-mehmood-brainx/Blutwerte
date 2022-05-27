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
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController.instantiate(from: .main)
        let navigationController  = UINavigationController(rootViewController: viewController)
        window.rootViewController =  navigationController
        window.makeKeyAndVisible()        
    }
}


