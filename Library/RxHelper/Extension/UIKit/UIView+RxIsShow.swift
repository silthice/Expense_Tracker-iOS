//
//  UIView+RxIsShow.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base : UIView {
    var visibility:Binder<VisibilityState> {
        return Binder<VisibilityState>(base, binding: { (target, value) in
            target.visibility = value
        })
    }
    
    var opacity:Binder<OpacityState> {
        return Binder<OpacityState>(base, binding: { (target, value) in
            target.opacity = value
        })
    }
}
