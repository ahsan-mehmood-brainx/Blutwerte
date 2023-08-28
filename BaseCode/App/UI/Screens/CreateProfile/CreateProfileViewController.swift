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
    private var gender: Gender = .male {
        didSet {
            profileView.setupGenderView(gender)
        }
    }
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addTargets()
    }
    
    override func setupBinding() {
        viewModel
            .$age
            .sink { [weak self] age in
                self?.profileView.ageTextField.text = String(age)
            }
            .store(in: &bag)
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
        viewModel.handleAgeViewTapped()
    }
    
    @objc
    func genderViewTapped(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag,
              let gender = Gender(rawValue: tag),
              self.gender != gender else {
            return
        }
        self.gender = gender
    }
    
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        profileView.setupGenderView(gender)
        updateNameCount(AppConstants.empty)
    }
    
    private func addTargets() {
        profileView.ageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(ageViewTapped))
        )
        profileView.maleView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(genderViewTapped))
        )
        profileView.femaleView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(genderViewTapped))
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
