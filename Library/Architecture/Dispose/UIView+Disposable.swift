//
//  UIView+Disposable.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

@objc extension UIView: Disposable {
    @objc public func dispose() {
//        Log.debug("\(self)", userInfo: LogTag.clearup.dictionary)  // too many error, put in subclass
        for subview in subviews {
            subview.dispose()
        }
        self.disposeBag = DisposeBag()
    }
}
