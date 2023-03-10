//
//  UIViewController+ErrorHandlingViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SwifterSwift

extension UIViewController: ErrorHandlingViewType {
    func exitToLogin() {
    }
    func showLoginSessionExpire(error:NSError) -> Driver<Void> {
        return present(error: error)
    }
}
