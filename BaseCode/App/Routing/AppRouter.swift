//
//  AppRouter.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

class AppRouter: Router {

    var navigationController: UINavigationController
    private var initialRoute: Route

    init(navigationController: UINavigationController, route: Route) {
        self.navigationController = navigationController
        self.initialRoute = route
    }

    func start() {
        let controller = initialRoute.controller()
        navigationController.pushViewController(controller, animated: true)
    }

    func append(_ route: Route) {
        let controller = route.controller()
        navigationController.pushViewController(controller, animated: true)
    }

    func pop() {
        navigationController.popViewController(animated: true)
    }

    func setRoot(_ route: Route) {
        let controller = route.controller()
        navigationController.viewControllers = [controller]
    }

    func showSheet(_ sheet: Sheet) {
        let controller = sheet.controller()
        navigationController.present(controller, animated: true)
    }
}
