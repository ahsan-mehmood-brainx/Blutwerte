//
//  Route.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Route {

    case splash
    case onboarding

    func controller() -> UIViewController {
        switch self {
        case .splash:
            let viewModel = SplashViewModel()
            return SplashViewController(viewModel: viewModel)
        case .onboarding:
            let viewModel = OnboardingViewModel()
            return OnboardingViewController(viewModel: viewModel)
        }
    }
}
