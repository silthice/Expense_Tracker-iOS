//
//  DI+TransactionDetail.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/04/2023.
//

import UIKit

extension DI.ViewPairs {
    struct TransactionDetail : DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "TransactionDetail", bundle: nil)

            // TransactionDetail
            DI.container.register(TransactionDetailViewControllerType.self) { r -> TransactionDetailViewControllerType in
                return storyboard.instantiateViewController(withIdentifier: "TransactionDetail")
            }
            DI.container.register(TransactionDetailViewModel.self) { (r) in
                return TransactionDetailViewModel()
            }
        }
    }
}
