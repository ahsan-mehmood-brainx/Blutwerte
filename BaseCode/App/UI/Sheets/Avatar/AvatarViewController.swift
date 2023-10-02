//
//  AvatarViewController.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import UIKit

enum Avatar: Int, CaseIterable {
    
    case avatar1
    case avatar2
    case avatar3
    case avatar4
    case avatar5
    case avatar6
    case avatar7
    case avatar8
    case avatar9
    case avatar10
    
    var image: UIImage {
        switch self {
        case .avatar1:
            return Asset.avatar1.image
        case .avatar2:
            return Asset.avatar2.image
        case .avatar3:
            return Asset.avatar3.image
        case .avatar4:
            return Asset.avatar4.image
        case .avatar5:
            return Asset.avatar5.image
        case .avatar6:
            return Asset.avatar6.image
        case .avatar7:
            return Asset.avatar7.image
        case .avatar8:
            return Asset.avatar8.image
        case .avatar9:
            return Asset.avatar9.image
        case .avatar10:
            return Asset.avatar10.image
        }
    }
}

class AvatarViewController: ViewController<AvatarViewModel> {

    //MARK: - Outlets
    
    @IBOutlet var avatarView: AvatarView!
    
    //MARK: - Properties
    
    private let spacing: CGFloat = 16
    private let spacingBetweenCells: CGFloat = 20
    private var numberOfItemsPerRow: CGFloat {
        let availableSpace = avatarView.collectionView.frame.width - 2 * spacing
        return (availableSpace + spacingBetweenCells) / 120
    }
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func setupBinding() {
        viewModel
            .$avatar
            .sink { [weak self] avatar in
                self?.avatarView.collectionView.reloadData()
            }
            .store(in: &bag)
    }
    
    //MARK: - Action Methods
    
    @IBAction
    func closeButtonTapped(_ sender: Any) {
        viewModel.handleCloseTapped()
    }
    
    @IBAction
    func actionButtonTapped(_ sender: Any) {
        viewModel.handleActionButtonTapped()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        avatarView.collectionView.registerNib(for: AvatarCollectionViewCell.self)
        avatarView.collectionView.dataSource = self
        avatarView.collectionView.delegate = self
        avatarView.collectionView.contentInset.top = spacing
        avatarView.collectionView.contentInset.left = spacing
        avatarView.collectionView.contentInset.right = spacing
    }
    
    private func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        let width = (avatarView.collectionView.frame.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}

//MARK: - UICollectionViewDataSource Conformance

extension AvatarViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Avatar.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AvatarCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        let avatar: Avatar = Avatar(rawValue: indexPath.row)!
        cell.setCellData(avatar, isSelected: avatar == viewModel.avatar)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout Conformance

extension AvatarViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.avatar = Avatar(rawValue: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sizeForItem(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacingBetweenCells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        spacingBetweenCells
    }
}
