//
//  DI+Home.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit

extension DI.ViewPairs {
    struct Home : DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)

            // Home
            DI.container.register(HomeViewControllerType.self) { r -> HomeViewControllerType in
                return storyboard.instantiateViewController(withIdentifier: "Home")
            }
            DI.container.register(HomeViewModel.self) { (r) in
                return HomeViewModel()
            }
        }
    }
}
