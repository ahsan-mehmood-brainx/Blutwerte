//
//  Sheet.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Sheet {

    case ageSelection

    func controller() -> UIViewController {
        switch self {
        case .ageSelection:
            let viewModel = AgeSelectionViewModel()
            return AgeSelectionViewController(viewModel: viewModel)
        }
    }
}
