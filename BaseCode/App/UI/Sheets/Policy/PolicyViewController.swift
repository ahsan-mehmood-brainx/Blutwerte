//
//  PolicyViewController.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 30/08/2023.
//

import UIKit

class PolicyViewController: ViewController<PolicyViewModel> {

    //MARK: - Outlets
    
    @IBOutlet var policyView: PolicyView!
    
    //MARK: - Properties
    
    private var isResearchChecked: Bool! {
        didSet {
            let imageName = isResearchChecked ? Images.checkedSquare : Images.unChecked
            policyView.researchCheckButton.setImage(UIImage(named: imageName), for: .normal)
            updateContinueButton()
        }
    }
    
    private var isTermsAndConditionsChecked: Bool! {
        didSet {
            let imageName = isTermsAndConditionsChecked ? Images.checkedSquare : Images.unChecked
            policyView.termsAndConditionsCheckButton.setImage(UIImage(named: imageName), for: .normal)
            updateContinueButton()
        }
    }
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addTargets()
    }
    
    //MARK: - Action Methods
    
    @IBAction
    func researchButtonTapped(_ sender: Any) {
        isResearchChecked.toggle()
    }
    
    @IBAction
    func termsAndConditionsButtonTapped(_ sender: Any) {
        isTermsAndConditionsChecked.toggle()
    }
    
    @IBAction
    func continueButtonTapped(_ sender: Any) {
        viewModel.handleContinueTapped()
    }
    
    @objc
    func viewTapped() {
        viewModel.handleViewTapped()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        isResearchChecked = false
        isTermsAndConditionsChecked = false
    }
    
    private func addTargets() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
    }

    private func updateContinueButton() {
        guard isResearchChecked,
              isTermsAndConditionsChecked else {
            policyView.continueButton.isUserInteractionEnabled = false
            policyView.continueButton.alpha = 0.4
            return
        }
        policyView.continueButton.isUserInteractionEnabled = true
        policyView.continueButton.alpha = 1
    }
}
