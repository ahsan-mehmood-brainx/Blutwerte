//
//  OnboardingCollectionViewCell.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 24/08/2023.
//

import Lottie
import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        [containerView, imageView, animationView].forEach {
            $0?.backgroundColor = .whiteLilac
        }
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .sfProText(withWeight: .bold, andSize: 24)
        titleLabel.textColor = .astral
        
        descriptionLabel.font = .sfProText(withWeight: .regular, andSize: 16)
        descriptionLabel.textColor = .hoki
    }
}
