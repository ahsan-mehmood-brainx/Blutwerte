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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var actionButton: UIButton!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .whiteLilac
        
        titleLabel.font = .sfProText(withWeight: .bold, andSize: 24)
        titleLabel.textColor = .astral
        
        descriptionLabel.font = .sfProText(withWeight: .regular, andSize: 16)
        descriptionLabel.textColor = .hoki
        
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
