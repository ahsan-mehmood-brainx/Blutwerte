//
//  AvatarCollectionViewCell.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import UIKit

class AvatarCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Public Methods
    
    func setCellData(_ avatar: Avatar, isSelected: Bool) {
        imageView.image = avatar.image
        guard isSelected else {
            containerView.clearBorder()
            return
        }
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Asset.astral.color.cgColor
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
    }
}
