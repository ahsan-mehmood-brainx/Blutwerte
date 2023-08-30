//
//  PolicyView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 29/08/2023.
//

import SwiftRichString
import UIKit

class PolicyView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var researchCheckButton: UIButton!
    @IBOutlet weak var researchLabel: UILabel!
    @IBOutlet weak var termsAndConditionsCheckButton: UIButton!
    @IBOutlet weak var termsAndConditionsCheckLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .mineShaft.withAlphaComponent(0.5)
        containerView.layer.cornerRadius = 17
        containerView.clipsToBounds = true
        containerView.backgroundColor = .whiteCustom
        
        titleLabel.text = L10n.Localizable.privacyTitle
        titleLabel.textColor = .bayOfMany
        titleLabel.font = .sfProText(withWeight: .semibold, andSize: 20)
        
        researchLabel.text = L10n.Localizable.researchDescription
        researchLabel.textColor = .emperor
        researchLabel.font = .sfProText(withWeight: .regular, andSize: 12)
        
        let normal = Style {
            $0.color = UIColor.emperor
            $0.font = UIFont.sfProText(withWeight: .regular, andSize: 12)
        }
        let attributed = Style {
            $0.color = UIColor.astral
        }
        
        let myGroup = StyleXML(base: normal, ["attributed": attributed])
        let string = """
        \(L10n.Localizable.iAcceptThe) \
        <attributed>\(L10n.Localizable.termsAndConditions)</attributed>, \
        \(L10n.Localizable.the) \
        <attributed>\(L10n.Localizable.termsOfUse)</attributed> \
        \(L10n.Localizable.andThe) \
        <attributed>\(L10n.Localizable.privacyPolicy)</attributed>
        """
        termsAndConditionsCheckLabel.attributedText = string.set(style: myGroup)
        
        continueButton.titleLabel?.font = .sfProText(withWeight: .regular, andSize: 16)
        continueButton.setTitleColor(.whiteCustom, for: .normal)
        continueButton.setTitle(L10n.Localizable.continue, for: .normal)
        continueButton.layer.cornerRadius = 10
        continueButton.backgroundColor = .astral
    }
}
