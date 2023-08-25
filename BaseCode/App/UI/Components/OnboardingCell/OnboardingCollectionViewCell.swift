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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var animationView: LottieAnimationView!
    
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
    }
}
