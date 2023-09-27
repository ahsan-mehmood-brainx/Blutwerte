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
    
    func setupNameField(withName name: String, maxCount max: Int) {
        nameTextField.text = name
        countLabel.text = String(max - name.count)
        countCircleProgressBarView.setProgressWithAnimation(
            value: Float(name.count) / Float(max)
        )
    }
    
    func setupGenderView(_ gender: Gender?) {
        [maleView, femaleView].forEach {
            $0?.clearBorder()
        }
        [maleLabel, femaleLabel].forEach {
            $0?.textColor = Asset.paleSky.color
        }
        switch gender {
        case .male:
            maleView.layer.borderWidth = 2
            maleView.layer.borderColor = Asset.astral.color.cgColor
            maleLabel.textColor = Asset.blackCustom.color
        case .female:
            femaleView.layer.borderWidth = 2
            femaleView.layer.borderColor = Asset.astral.color.cgColor
            femaleLabel.textColor = Asset.blackCustom.color
        default:
            return
        }
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = Asset.whiteLilac.color
        
        titleLabel.textColor = Asset.blackCustom.color
        titleLabel.font = .primary(withWeight: .semibold, andSize: 30)
        titleLabel.text = L10n.Localizable.createProfile
        
        avatorView.backgroundColor = Asset.whiteLilac.color
        
        avatorImageView.backgroundColor = Asset.whiteLilac.color
        avatorImageView.addShadow(
            color: Asset.bayOfMany.color.withAlphaComponent(0.16),
            x: 0,
            y: 0,
            alpha: 0.94,
            radius: 6
        )
        avatorImageView.layer.cornerRadius = avatorImageView.frame.size.width / 2
        
        nameTitle.textColor = Asset.ghost.color
        nameTitle.font = .primary(withWeight: .regular, andSize: 12)
        nameTitle.text = L10n.Localizable.name
        
        nameView.layer.cornerRadius = 12
        nameView.backgroundColor = Asset.whiteCustom.color
        
        nameTextField.font = .primary(withWeight: .regular, andSize: 14)
        nameTextField.textColor = Asset.paleSky.color
        
        countCircleProgressBarView.trackColor = Asset.astral.color
        
        countLabel.font = .primary(withWeight: .regular, andSize: 12)
        countLabel.textColor = Asset.bayOfMany.color
        
        ageTitle.textColor = Asset.ghost.color
        ageTitle.font = .primary(withWeight: .regular, andSize: 12)
        ageTitle.text = L10n.Localizable.age
        
        ageView.layer.cornerRadius = 12
        ageView.backgroundColor = Asset.whiteCustom.color
        
        ageTextField.font = .primary(withWeight: .regular, andSize: 14)
        ageTextField.textColor = Asset.paleSky.color
        ageTextField.isUserInteractionEnabled = false
        
        genderTitle.textColor = Asset.paleSky.color
        genderTitle.font = .primary(withWeight: .regular, andSize: 14)
        genderTitle.text = L10n.Localizable.gender
        
        maleView.layer.cornerRadius = 12
        maleView.tag = Gender.male.rawValue
        
        maleLabel.text = Gender.male.title
        maleLabel.font = .primary(withWeight: .regular, andSize: 14)
        
        femaleView.layer.cornerRadius = 12
        femaleView.tag = Gender.female.rawValue
        
        femaleLabel.text = Gender.female.title
        femaleLabel.font = .primary(withWeight: .regular, andSize: 14)
        
        descriptionView.backgroundColor = Asset.whiteLilac.color
        
        descriptionLabel.textColor = Asset.blackCustom.color
        descriptionLabel.font = .primary(withWeight: .regular, andSize: 14)
        descriptionLabel.text = L10n.Localizable.genderDescription
        
        actionButton.setTitle(L10n.Localizable.add, for: .normal)
        actionButton.titleLabel?.font = .secondary(withWeight: .regular, andSize: 16)
        actionButton.setTitleColor(Asset.whiteCustom.color, for: .normal)
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = Asset.astral.color
        actionButton.addShadow(
            color: Asset.astral.color.withAlphaComponent(0.12),
            x: 0,
            y: 12,
            alpha: 0.84,
            radius: 12
        )
    }
}
