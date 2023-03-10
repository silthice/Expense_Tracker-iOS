//
//  UIView+Opacity.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

enum OpacityState{
    case opaque
    case transparent
    case fiftyPercent
    case disabled
    case custom(value:CGFloat)
}

extension UIView {
    // Supplement for alpha for more meaningful values
    // .opaque -> view.alpha = 1.0
    // .transparent -> view.alpha = 0.0
    // usage : someView.opacity = .transparent
    var opacity: OpacityState {
        get {
            switch self.alpha {
            case 1.0: return .opaque
            case 0.0: return .transparent
            case 0.5: return .fiftyPercent
            default: return .custom(value:self.alpha)
            }
        }
        set {
            switch newValue {
            case .opaque: self.alpha = 1.0
            case .transparent: self.alpha = 0.0
            case .fiftyPercent: self.alpha = 0.5
            case .disabled: self.alpha = 0.3
            case .custom(let value): self.alpha = value
            }
        }
    }
}
