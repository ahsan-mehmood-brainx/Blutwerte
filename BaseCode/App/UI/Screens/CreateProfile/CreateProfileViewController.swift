//
//  CreateProfileViewController.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 25/08/2023.
//

import UIKit

class CreateProfileViewController: ViewController<CreateProfileViewModel> {

    //MARK: - Outlets
    
    @IBOutlet var profileView: CreateProfileView!
    
    //MARK: - Properties
    
    private var currentCount: Int = 0
    private let maxCount: Int = 15
    private var isMale: Bool = true {
        didSet {
            profileView.setupGenderView(isMale: isMale)
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
    func backButtonTapped(_ sender: Any) {
    }
    
    @IBAction
    func addAvatorButtonTapped(_ sender: Any) {
    }
    
    @IBAction
    func nameTextFieldChanged(_ textField: UITextField) {
        updateNameCount(textField.text ?? AppConstants.empty)
    }
    
    @IBAction
    func actionButtonTapped(_ sender: Any) {
    }
    
    @objc
    func ageViewTapped() {
        viewModel.router.showSheet(.ageSelection)
    }
    
    @objc
    func maleButtonTapped() {
        isMale = true
    }
    
    @objc
    func femaleButtonTapped() {
        isMale = false
    }
    
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        profileView.setupGenderView(isMale: isMale)
        updateNameCount(AppConstants.empty)
    }
    
    private func addTargets() {
        profileView.ageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(ageViewTapped))
        )
        profileView.maleView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(maleButtonTapped))
        )
        profileView.femaleView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(femaleButtonTapped))
        )
    }
    
    private func updateNameCount(_ text: String) {
        currentCount = text.count
        guard currentCount <= maxCount else {
            currentCount = maxCount
            profileView.countLabel.text = String(maxCount - currentCount)
            profileView.nameTextField.text = String(text.prefix(maxCount))
            return
        }
        profileView.countLabel.text = String(maxCount - currentCount)
    }
}
