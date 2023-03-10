//
//  UIView+ErrorHandlingViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

extension UIView: ErrorHandlingViewType {
    func exitToLogin() {
        self.parentViewController?.exitToLogin()
    }
    var errorHandlingView:ErrorHandlingViewType? {
        return self.parentViewController
    }
    func showLoginSessionExpire(error:NSError) -> Driver<Void> {
        return self.parentViewController?.showLoginSessionExpire(error: error) ?? Driver.empty()
    }
}

