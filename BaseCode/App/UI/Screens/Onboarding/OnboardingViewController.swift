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
    
    //MARK: - Properties
    
    private var timer = Timer()
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupCollectionViewLayout()
        updateTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    //MARK: - Action Methods
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        viewModel.moveToCreateProfile()
    }
    
    @objc
    func scrollToNextPage() {
        let currentPage = onboardingView.pageController.currentPage
        guard currentPage < viewModel.onboardingCells.count else {
            return
        }
        onboardingView.pageController.currentPage = currentPage + 1
    }
    
    @objc
    func showTransition() {
        UIView.animate(withDuration: 0.6, delay: 0.1, options: .curveEaseInOut ,animations: {
            self.onboardingView.tranitionView.frame = self.onboardingView.frame
            self.onboardingView.tranitionView.alpha = 1
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewModel.moveToCreateProfile()
        }
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        onboardingView.collectionView.registerNib(for: OnboardingCollectionViewCell.self)
        onboardingView.collectionView.dataSource = self
        onboardingView.collectionView.delegate = self
        onboardingView.pageController.delegate = self
        onboardingView.pageController.numberOfPages = viewModel.onboardingCells.count
        onboardingView.tranitionView.alpha = 0
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        onboardingView.collectionView.collectionViewLayout = layout
    }
    
    private func updateTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector: #selector(scrollToNextPage),
            userInfo: nil,
            repeats: true
        )
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                self.showTransition()
            }
        } else {
            cell.animationView.isHidden = true
            cell.imageView.isHidden = false
            cell.imageView.image = UIImage(named: onboarding.imageName ?? .empty)
        }
        cell.titleLabel.text = onboarding.title
        cell.descriptionLabel.text = onboarding.descpription
        return cell
    }
}

//MARK: - UICollectionViewDelegate Conformance

extension OnboardingViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        let currentPage = Int(offSet + horizontalCenter) / Int(width)
        onboardingView.pageController.currentPage = currentPage
        updateTimer()
    }
}

//MARK: - UICollectionViewDelegateFlowLayout Conformance

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        onboardingView.collectionView.frame.size
    }
}

//MARK: - CustomPageControlDelegate Conformance

extension OnboardingViewController: CustomPageControlDelegate {
    
    func pageControl(_ pageControl: CustomPageControl, didUpdateTo activePage: Int) {
        onboardingView.collectionView.scrollToItem(
            at: IndexPath(row: activePage, section: 0),
            at: .centeredHorizontally,
            animated: true
        )
        updateTimer()
    }
}
