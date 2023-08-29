//
//  CreateProfileView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 25/08/2023.
//

import UIKit

class CreateProfileView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatorView: UIView!
    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countCircleProgressBarView: CircularProgressBarView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var ageTitle: UILabel!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTitle: UILabel!
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Public Methods
    
    func setupGenderView(_ gender: Gender) {
        [maleView, femaleView].forEach {
            $0?.clearBorder()
        }
        [maleLabel, femaleLabel].forEach {
            $0?.textColor = .paleSky
        }
        switch gender {
        case .male:
            maleView.layer.borderWidth = 2
            maleView.layer.borderColor = UIColor.astral.cgColor
            maleLabel.textColor = .blackCustom
        case .female:
            femaleView.layer.borderWidth = 2
            femaleView.layer.borderColor = UIColor.astral.cgColor
            femaleLabel.textColor = .blackCustom
        }
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .whiteLilac
        
        titleLabel.textColor = .blackCustom
        titleLabel.font = .sfProText(withWeight: .semibold, andSize: 30)
        titleLabel.text = L10n.Localizable.createProfile
        
        avatorView.backgroundColor = .whiteLilac
        
        avatorImageView.backgroundColor = .whiteLilac
        avatorImageView.addShadow(
            color: .bayOfMany.withAlphaComponent(0.16),
            x: 0,
            y: 0,
            alpha: 0.94,
            radius: 6
        )
        avatorImageView.layer.cornerRadius = avatorImageView.frame.size.width / 2
        
        nameTitle.textColor = .ghost
        nameTitle.font = .sfProText(withWeight: .regular, andSize: 12)
        nameTitle.text = L10n.Localizable.name
        
        nameView.layer.cornerRadius = 12
        nameView.backgroundColor = .whiteCustom
        
        nameTextField.font = .sfProText(withWeight: .regular, andSize: 14)
        nameTextField.textColor = .paleSky
        
        countCircleProgressBarView.trackColor = .periwinKleGray
        countCircleProgressBarView.trackColor = .astral
        
        countLabel.font = .sfProText(withWeight: .regular, andSize: 12)
        countLabel.textColor = .bayOfMany
        
        ageTitle.textColor = .ghost
        ageTitle.font = .sfProText(withWeight: .regular, andSize: 12)
        ageTitle.text = L10n.Localizable.age
        
        ageView.layer.cornerRadius = 12
        ageView.backgroundColor = .whiteCustom
        
        ageTextField.font = .sfProText(withWeight: .regular, andSize: 14)
        ageTextField.textColor = .paleSky
        ageTextField.isUserInteractionEnabled = false
        
        genderTitle.textColor = .paleSky
        genderTitle.font = .sfProText(withWeight: .regular, andSize: 14)
        genderTitle.text = L10n.Localizable.gender
        
        maleView.layer.cornerRadius = 12
        maleView.tag = Gender.male.rawValue
        
        maleLabel.text = Gender.male.title
        maleLabel.font = .sfProText(withWeight: .regular, andSize: 14)
        
        femaleView.layer.cornerRadius = 12
        femaleView.tag = Gender.female.rawValue
        
        femaleLabel.text = Gender.female.title
        femaleLabel.font = .sfProText(withWeight: .regular, andSize: 14)
        
        descriptionView.backgroundColor = .whiteLilac
        
        descriptionLabel.textColor = .blackCustom
        descriptionLabel.font = .sfProText(withWeight: .regular, andSize: 14)
        descriptionLabel.text = L10n.Localizable.genderDescription
        
        actionButton.setTitle(L10n.Localizable.add, for: .normal)
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
