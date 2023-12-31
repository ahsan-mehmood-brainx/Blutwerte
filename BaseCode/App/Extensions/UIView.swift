//
//  UIView.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

extension UIView {

    enum GradientDirection {
        case vertical
        case horizontal
        case diagonal

        var start: CGPoint {
            return CGPoint(x: 0, y: 0)
        }

        var end: CGPoint {
            switch self {
            case .vertical: return CGPoint(x: 0, y: 1)
            case .horizontal: return CGPoint(x: 1, y: 0)
            case .diagonal: return CGPoint(x: 1, y: 1)
            }
        }
    }

    @discardableResult
    func addGradient(_ direction: GradientDirection, withColor colors: [UIColor], cornerRadius: CGFloat = 0, shouldPushInBackground: Bool = true) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = direction.start
        gradientLayer.endPoint = direction.end
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        if shouldPushInBackground {
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            layer.addSublayer(gradientLayer)
        }

        return gradientLayer
    }

    @discardableResult
    func loadFromNib<T: UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let loadedView = bundle.loadNibNamed(String(describing: type(of: self)),
                                             owner: self,
                                             options: nil)?.first
        guard let contentView = loadedView as? T else {
            return nil
        }
        return contentView
    }

    func fixInView(_ container: UIView, with padding: CGFloat = 0) {
        frame = container.bounds
        container.addSubview(self)
        addEqualConstraintsWith(container, with: padding)
    }

    func addEqualConstraintsWith(_ view: UIView, with constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        ])
    }

    func takeScreenshot() -> UIImage? {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
    
    func addShadow(color: UIColor, x: CGFloat, y: CGFloat, alpha: Float, radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowOpacity = alpha
        layer.shadowRadius = radius
    }
    
    func clearBorder() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
    }
}
