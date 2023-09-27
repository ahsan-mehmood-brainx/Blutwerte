//
//  Sheet.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Sheet {

    case ageSelection(age: Int, selectedAge: ((_ age: Int) -> Void))
    case avatar(avatar: Avatar?, selectedAvatar: ((Avatar?) -> Void))
    case policy
    
    func controller() -> UIViewController {
        switch self {
        case let .ageSelection(age, selectedAge):
            let viewModel = AgeSelectionViewModel(age: age, selectedAge: selectedAge)
            return AgeSelectionViewController(viewModel: viewModel)
            
        case let .avatar(avatar, selectedAvatar):
            let viewModel = AvatarViewModel(avatar: avatar, selectedAvatar: selectedAvatar)
            let viewController =  AvatarViewController(viewModel: viewModel)
            viewController.modalPresentationStyle = .fullScreen
            return viewController
            
        case .policy:
            let viewModel = PolicyViewModel()
            let viewController = PolicyViewController(viewModel: viewModel)
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.modalTransitionStyle = .crossDissolve
            return viewController
        }
    }
}
