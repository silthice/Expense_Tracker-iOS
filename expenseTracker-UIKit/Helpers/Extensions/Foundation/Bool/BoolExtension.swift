//
//  BoolExtension.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Bool {
    var visibility: VisibilityState {
        return self ? .visible : .hidden
    }
}

extension Bool {
    var opacity: OpacityState {
        return self ? .opaque : .transparent
    }
}
