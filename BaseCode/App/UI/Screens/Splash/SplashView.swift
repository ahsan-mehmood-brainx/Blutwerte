//
//  SplashView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 24/08/2023.
//

import Lottie
import UIKit

class SplashView: UIView {
    
    @IBOutlet weak var splashAnimation: LottieAnimationView!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = Asset.whiteLilac.color
        
        splashAnimation.backgroundColor = Asset.whiteLilac.color
        splashAnimation.contentMode = .scaleAspectFit
    }
}
