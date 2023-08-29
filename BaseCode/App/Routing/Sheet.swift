//
//  Sheet.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Sheet {

    case ageSelection(age: Int, ageDismissClosure: ((_ age: Int) -> Void))
    case avatar
    
    func controller() -> UIViewController {
        switch self {
        case let .ageSelection(age, ageDismissClosure):
            let viewModel = AgeSelectionViewModel()
            viewModel.selectedRow = age - 1
            viewModel.ageClosure = ageDismissClosure
            return AgeSelectionViewController(viewModel: viewModel)
            
        case .avatar:
            let viewModel = AvatarViewModel()
            let ViewController =  AvatarViewController(viewModel: viewModel)
            ViewController.modalPresentationStyle = .fullScreen
            return ViewController
        }
    }
}
