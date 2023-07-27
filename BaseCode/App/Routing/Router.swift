//
//  Router.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import Foundation

protocol Router {

    func start()
    func append(_ route: Route)
    func pop()
    func setRoot(_ route: Route)
    func showSheet(_ sheet: Sheet)

}
