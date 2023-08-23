//
//  SplashViewController.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

class SplashViewController: ViewController<SplashViewModel> {
    
    //MARK: - Outlets
    
    @IBOutlet var splashView: SplashView!
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //MARK: - Action Methods
    
    @objc
    private func moveToNextScreen() {
        print("d:D")
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        splashView.splashAnimation.contentMode = .scaleAspectFit
        splashView.splashAnimation.play()
        Timer.scheduledTimer(
            timeInterval: 3.6,
            target: self,
            selector: #selector(moveToNextScreen),
            userInfo: nil,
            repeats: false
        )
        print("d:",splashView.splashAnimation.)
    }
}
