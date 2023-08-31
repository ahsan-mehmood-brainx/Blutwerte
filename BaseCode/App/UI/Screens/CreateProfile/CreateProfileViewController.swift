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
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addTargets()
    }
    
    override func setupBinding() {
        viewModel
            .$avatar
            .sink { [weak self] avatar in
                self?.profileView.avatorImageView.image = avatar?.image ?? UIImage(named: Images.profilePlaceholder)
            }
            .store(in: &bag)
        viewModel
            .$currentNameCount
            .sink { [weak self] count in
                guard let self = self else {
                    return
                }
                self.profileView.setupNameField(
                    withName: self.viewModel.userName,
                    maxCount: self.viewModel.maxNameCount
                )
            }
            .store(in: &bag)
        viewModel
            .$age
            .sink { [weak self] age in
                if age > 0 {
                    self?.profileView.ageTextField.text = String(age)
                }
            }
            .store(in: &bag)
        viewModel
            .$gender
            .sink { [weak self] gender in
                self?.profileView.setupGenderView(gender)
            }
            .store(in: &bag)
    }
    
    //MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: Any) {
    }
    
    @IBAction
    func addAvatorButtonTapped(_ sender: Any) {
        viewModel.handleAddAvatarTapped()
    }
    
    @IBAction
    func nameTextFieldChanged(_ textField: UITextField) {
        viewModel.userName = textField.text ?? AppConstants.empty
    }
    
    @IBAction
    func actionButtonTapped(_ sender: Any) {
        switch viewModel.validateUser() {
        case let .invalid(message):
            showAlert(with: message)
        case .valid:
            viewModel.showPolicyScreen()
        }
    }
    
    @objc
    func ageViewTapped() {
        viewModel.handleAgeViewTapped()
    }
    
    @objc
    func genderViewTapped(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag,
              let gender = Gender(rawValue: tag),
              viewModel.gender != gender else {
            return
        }
        viewModel.gender = gender
    }
    
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        profileView.setupGenderView(viewModel.gender)
        viewModel.userName = AppConstants.empty
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
}
