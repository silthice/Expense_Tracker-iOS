//
//  DI+CategorySelection.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/04/2023.
//

import UIKit

extension DI.ViewPairs {
    struct CategorySelection : DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "CategorySelection", bundle: nil)

            // TransactionDetail
            DI.container.register(CategorySelectionViewControllerType.self) { r -> CategorySelectionViewControllerType in
                return storyboard.instantiateViewController(withIdentifier: "CategorySelection")
            }
            DI.container.register(CategorySelectionViewModel.self) { (r) in
                return CategorySelectionViewModel()
            }
        }
    }
}
