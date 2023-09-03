//
//  OnboardingView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 23/08/2023.
//

import UIKit

class OnboardingView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: CustomPageControl!
    @IBOutlet weak var actionButton: UIButton!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .whiteLilac
        
        pageController.backgroundColor = .whiteLilac
        
        actionButton.titleLabel?.font = .sfProDisplay(withWeight: .regular, andSize: 16)
        actionButton.setTitleColor(.whiteCustom, for: .normal)
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = .astral
        actionButton.addShadow(
            color: .astral.withAlphaComponent(0.12),
            x: 0,
            y: 12,
            alpha: 0.84,
            radius: 12
        )
    }
}
