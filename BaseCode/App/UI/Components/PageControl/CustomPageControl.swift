//
//  PageControl.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 31/08/2023.
//

import UIKit

protocol CustomPageControlDelegate {
    func pageControl(_ pageControl: CustomPageControl, didUpdateTo activePage: Int)
}

class CustomPageControl: UIPageControl {
    
    //MARK: - Properties
    
    var delegate: CustomPageControlDelegate?
    private var activeColor: UIColor = Asset.astral.color
    private var inactiveColor: UIColor = Asset.periwinKleGray.color
    
    private var activeSize: CGSize = CGSize(width: 16, height: 8)
    private var inactiveSize: CGSize = CGSize(width: 8, height: 8)
    
    private var dotSpacing: CGFloat = 8.0
    
    private var dots: [UIView] = []
    
    override var currentPage: Int {
        didSet {
            updateDots()
            delegate?.pageControl(self, didUpdateTo: currentPage)
        }
    }
    
    override var numberOfPages: Int {
        didSet {
            updateDots()
        }
    }
    
    //MARK: - Lifecyle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTargets()
    }
    
    //MARK: - Action Methods
    
    @objc
    func pageControlValueChanged() {
        updateDots()
    }
    
    //MARK: - Private Methods
    
    private func addTargets() {
        addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
    }
    
    private func updateDots() {
        dots.forEach { $0.removeFromSuperview() }
        dots.removeAll()
        
        for i in 0..<numberOfPages {
            let dot = UIView()
            dot.backgroundColor = i == currentPage ? activeColor : inactiveColor
            dot.layer.cornerRadius = i == currentPage ? activeSize.height / 2 : inactiveSize.height / 2
            dot.translatesAutoresizingMaskIntoConstraints = false
            addSubview(dot)
            dots.append(dot)
            
            let centerXConstraint = dot.centerXAnchor.constraint(equalTo: centerXAnchor, constant: CGFloat((i - numberOfPages / 2) * (Int(activeSize.width) + Int(dotSpacing))))
            let centerYConstraint = dot.centerYAnchor.constraint(equalTo: centerYAnchor)
            let widthConstraint = dot.widthAnchor.constraint(equalToConstant: i == currentPage ? activeSize.width : inactiveSize.width)
            let heightConstraint = dot.heightAnchor.constraint(equalToConstant: i == currentPage ? activeSize.height : inactiveSize.height)
            
            NSLayoutConstraint.activate([centerXConstraint, centerYConstraint, widthConstraint, heightConstraint])
        }
    }
}
