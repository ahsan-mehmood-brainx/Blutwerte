//
//  AgeSelectionViewModel.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import Foundation

class AgeSelectionViewModel: ViewModel {
    
    //MARK: - Properties
    
    var selectedRow: Int
    var selectedAge: ((_ age: Int) -> Void)
    
    //MARK: - Initializers
    
    init(age: Int, selectedAge: @escaping (_ age: Int) -> Void) {
        selectedRow = age - 1
        self.selectedAge = selectedAge
    }
    
    //MARK: - Methods
    
    func handleDimiss() {
        selectedAge(selectedRow + 1)
    }
}
