//
//  UITextField.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 27/09/2023.
//

import Combine
import UIKit

extension UITextField {
    
    var textDidChangePublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }
}
