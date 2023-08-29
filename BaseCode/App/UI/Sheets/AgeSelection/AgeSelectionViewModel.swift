//
//  AgeSelectionViewModel.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import Foundation

class AgeSelectionViewModel: ViewModel {
    
    //MARK: - Properties
    
    var selectedRow = 0
    var selectedAge: ((_ age: Int) -> Void)?
    
    //MARK: - Methods
    
    func handleDimiss() {
        selectedAge?(selectedRow + 1)
    }
}
