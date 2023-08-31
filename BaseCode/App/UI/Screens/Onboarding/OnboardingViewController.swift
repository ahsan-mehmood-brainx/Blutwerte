//
//  OnboradingViewController.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 24/08/2023.
//

import UIKit

class OnboardingViewController: ViewController<OnboardingViewModel> {
    
    //MARK: - Outlets
    
    @IBOutlet var onboardingView: OnboardingView!
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupCollectionViewLayout()
    }
    
    //MARK: - Action Methods
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        viewModel.router.append(.createProfile)
    }
    
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        onboardingView.collectionView.registerNib(for: OnboardingCollectionViewCell.self)
        onboardingView.collectionView.dataSource = self
        onboardingView.collectionView.delegate = self
        onboardingView.transitionView.alpha = 0
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        onboardingView.collectionView.collectionViewLayout = layout
    }
}

//MARK: - UICollectionViewDataSource Conformance

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.onboardingCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardingCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        let onboarding: Onboarding = viewModel.onboardingCells[indexPath.item]
        if onboarding.showAnimation {
            cell.imageView.isHidden = true
            cell.animationView.isHidden = false
            cell.animationView.loopMode = .loop
            cell.animationView.play()
            onboardingView.actionButton.setTitle(L10n.Localizable.getStarted, for: .normal)
        } else {
            cell.animationView.isHidden = true
            cell.imageView.isHidden = false
            cell.imageView.image = UIImage(named: onboarding.imageName ?? AppConstants.empty)
            onboardingView.actionButton.setTitle(L10n.Localizable.continue, for: .normal)
        }
        onboardingView.titleLabel.text = onboarding.title
        onboardingView.descriptionLabel.text = onboarding.descpription
        return cell
    }
}

//MARK: - UICollectionViewDelegate Conformance

extension OnboardingViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDelegateFlowLayout Conformance

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        onboardingView.collectionView.frame.size
    }
}
