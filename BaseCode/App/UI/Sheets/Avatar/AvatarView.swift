//
//  AvatarView.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import UIKit

class AvatarView: UIView {
    
    //MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var actionButton: UIButton!
    
    //MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = Asset.whiteLilac.color
        
        titleLabel.text = L10n.Localizable.selectAvatar
        titleLabel.font = .primary(withWeight: .medium, andSize: 16)
        titleLabel.textColor = Asset.blackCustom.color
        
        collectionView.backgroundColor = Asset.whiteLilac.color
        
        actionButton.titleLabel?.font = .secondary(withWeight: .regular, andSize: 14)
        actionButton.setTitleColor(Asset.whiteCustom.color, for: .normal)
        actionButton.setTitle(L10n.Localizable.selectChanges, for: .normal)
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
