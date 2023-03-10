//
//  DismissWithResultProtocol+Rx.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift
import RxCocoa

extension Reactive where Base: DismissWithResultProtocol {
    var onDismissResult: Single<DismissResult> {
        return base.onDismissResult.asSingle()
    }
}
