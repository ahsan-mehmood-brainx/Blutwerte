//
//  PolicyViewModel.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 29/08/2023.
//

import Foundation

class PolicyViewModel: ViewModel {
    
    //MARK: - Methods
    
    func handleViewTapped() {
        router.dismiss()
    }
    
    func handleContinueTapped() {
        router.dismiss()
        router.showSheet(.tabbar)
    }
}
