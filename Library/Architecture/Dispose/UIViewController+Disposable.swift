//
//  UIViewController+Disposable.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

@objc extension UIViewController: Disposable {
    @objc public func dispose() {
        Log.debug("\(self)", userInfo: LogTag.clearup.dictionary)
        for child in children {
            child.dispose()
        }
        if isViewLoaded {
            view.dispose()
        }
        self.disposeBag = DisposeBag()
    }
}
