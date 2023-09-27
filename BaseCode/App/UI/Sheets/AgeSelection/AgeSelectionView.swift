//
//  AgeSelectionView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import UIKit

class AgeSelectionView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var contententView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var agePickerView: UIPickerView!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Public Methods
    
    func setupPicker(age: Int) {
        guard age > 0, age <= 100 else {
            return
        }
        agePickerView.selectRow(age - 1, inComponent: 0, animated: true)
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        contententView.backgroundColor = Asset.whiteLilac.color
        contententView.clipsToBounds = true
        contententView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contententView.layer.cornerRadius = 13
        
        titleLabel.text = L10n.Localizable.selectYourAge
        titleLabel.font = .sfProText(withWeight: .medium, andSize: 16)
        titleLabel.textColor = Asset.blackCustom.color
    }
}
