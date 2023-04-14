//
//  DI+ETAlertView.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import UIKit

extension DI.ViewPairs {
    struct ETAlertView : DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "ETAlertView", bundle: nil)

            // ETAlertView
            DI.container.register(ETAlertViewControllerType.self) { r -> ETAlertViewControllerType in
                return storyboard.instantiateViewController(withIdentifier: "ETAlertView")
            }
            DI.container.register(ETAlertViewModel.self) { (r) in
                return ETAlertViewModel()
            }
        }
    }
}
