//
//  DI+Dashboard.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import Foundation
import UIKit

extension DI.ViewPairs {
    struct Dashboard: DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
            
            DI.container.register(DashboardTabBarControllerType.self) { r -> DashboardTabBarControllerType in
                return storyboard.instantiateViewController(withIdentifier: "DashboardTabBarController")
            }
        }
    }
}

