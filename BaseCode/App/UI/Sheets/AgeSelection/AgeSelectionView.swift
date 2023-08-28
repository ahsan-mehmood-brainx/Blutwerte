//
//  AgeSelectionView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import UIKit

class AgeSelectionView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var contententView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var agePickerView: UIPickerView!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundView.backgroundColor = .clear
        
        contententView.backgroundColor = .whiteLilac
        contententView.clipsToBounds = true
        contententView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contententView.layer.cornerRadius = 13
        
        titleLabel.text = L10n.Localizable.selectYourAge
        titleLabel.font = .sfProText(withWeight: .medium, andSize: 16)
        titleLabel.textColor = .blackCustom
        
        
    }
}
