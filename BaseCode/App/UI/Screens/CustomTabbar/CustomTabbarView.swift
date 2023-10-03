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
            homeImageView.tintColor = Asset.astral.color
            homeLabel.textColor = Asset.astral.color
        case .tests:
            testImageView.tintColor = Asset.astral.color
            testLabel.textColor = Asset.astral.color
        case .add:
            return
        case .charts:
            chartsImageView.tintColor = Asset.astral.color
            chartsLabel.textColor = Asset.astral.color
        case .more:
            moreImageView.tintColor = Asset.astral.color
            moreLabel.textColor = Asset.astral.color
        }
    }
    
    func removeActiveTab() {
        [homeImageView, testImageView, chartsImageView, moreImageView].forEach {
            $0?.tintColor = Asset.silver.color
        }
        [homeLabel, testLabel, chartsLabel, moreLabel].forEach {
            $0?.textColor = Asset.silver.color
        }
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = Asset.whiteLilac.color
        
        containerView.backgroundColor = Asset.whiteLilac.color
        
        tabView.backgroundColor = Asset.whiteCustom.color
        tabView.layer.cornerRadius = 12
        tabView.clipsToBounds = true
        tabView.addShadow(
            color: Asset.bayOfMany.color.withAlphaComponent(0.12),
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
            $0?.font = .primary(withWeight: .regular, andSize: 12)
        }
    }
}
