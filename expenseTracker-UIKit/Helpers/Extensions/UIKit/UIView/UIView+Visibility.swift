//
//  UIView+Visibility.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

enum VisibilityState {
    case visible
    case hidden
    
    var opacityState:OpacityState {
        switch self {
        case .visible : return .fiftyPercent
        case .hidden : return .transparent
        }
    }
    
    mutating func toggle() -> VisibilityState {
        switch self {
        case .visible : self = .hidden; return self
        case .hidden : self = .visible; return self
        }
    }
    
    static prefix func !(state:VisibilityState) -> VisibilityState {
        switch state {
        case .visible:
            return .hidden
        case .hidden:
            return .visible
        }
    }
}

extension UIView {
    // Supplement for isHidden for more meaningful values
    // .visible -> view.isHidden = false
    // .hidden -> view.isHidden = true
    // usage : someView.visibility = .hidden
    var visibility: VisibilityState {
        get {
            return self.isHidden ? .hidden : .visible
        }
        set {
            switch newValue {
            case .visible: self.isHidden = false
            case .hidden: self.isHidden = true
            }
        }
    }
}
