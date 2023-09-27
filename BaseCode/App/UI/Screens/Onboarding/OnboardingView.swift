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
    @IBOutlet weak var tranitionView: UIView!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = Asset.whiteLilac.color
        
        pageController.backgroundColor = Asset.whiteLilac.color
        
        actionButton.titleLabel?.font = .sfProDisplay(withWeight: .regular, andSize: 16)
        actionButton.setTitleColor(Asset.whiteCustom.color, for: .normal)
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = Asset.astral.color
        actionButton.addShadow(
            color: Asset.astral.color.withAlphaComponent(0.12),
            x: 0,
            y: 12,
            alpha: 0.84,
            radius: 12
        )
        
        tranitionView.backgroundColor = Asset.astral.color
    }
}
