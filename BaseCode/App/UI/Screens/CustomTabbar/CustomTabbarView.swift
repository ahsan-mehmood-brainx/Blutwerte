//
//  CustomTabbarView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 30/08/2023.
//

import UIKit

class CustomTabbarView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabView: UIStackView!
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeLabel: UILabel!
    
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testImageView: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var addView: UIView!
    
    @IBOutlet weak var chartsView: UIView!
    @IBOutlet weak var chartsImageView: UIImageView!
    @IBOutlet weak var chartsLabel: UILabel!
    
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var moreImageView: UIImageView!
    @IBOutlet weak var moreLabel: UILabel!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Methods
    
    func setActiveView(tab: TabItem) {
        removeActiveTab()
        switch tab {
        case .home:
            homeImageView.tintColor = .astral
            homeLabel.textColor = .astral
        case .tests:
            testImageView.tintColor = .astral
            testLabel.textColor = .astral
        case .add:
            return
        case .charts:
            chartsImageView.tintColor = .astral
            chartsLabel.textColor = .astral
        case .more:
            moreImageView.tintColor = .astral
            moreLabel.textColor = .astral
        }
    }
    
    func removeActiveTab() {
        [homeImageView, testImageView, chartsImageView, moreImageView].forEach {
            $0?.tintColor = .silver
        }
        [homeLabel, testLabel, chartsLabel, moreLabel].forEach {
            $0?.textColor = .silver
        }
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .whiteLilac
        
        containerView.backgroundColor = .whiteLilac
        
        tabView.backgroundColor = .whiteCustom
        tabView.layer.cornerRadius = 12
        tabView.clipsToBounds = true
        tabView.addShadow(
            color: .bayOfMany.withAlphaComponent(0.12),
            x: 0,
            y: 0,
            alpha: 0.8,
            radius: 3
        )
        
        homeLabel.text = L10n.Localizable.home
        testLabel.text = L10n.Localizable.values
        chartsLabel.text = L10n.Localizable.charts
        moreLabel.text = L10n.Localizable.more
        
        [homeLabel, testLabel, chartsLabel, moreLabel].forEach {
            $0?.font = .sfProText(withWeight: .regular, andSize: 12)
        }
    }
}
