//
//  CreateProfileViewModel.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 25/08/2023.
//

import Combine
import Foundation

class CreateProfileViewModel: ViewModel {
    
    //MARK: - Properties
    
    @Published var age: Int = 0
    
    //MARK: - Methods
    
    func handleAgeViewTapped() {
        router.showSheet(.ageSelection(age: age, ageDismissClosure: { [weak self] age in
            self?.age = age
        }))
    }
}
