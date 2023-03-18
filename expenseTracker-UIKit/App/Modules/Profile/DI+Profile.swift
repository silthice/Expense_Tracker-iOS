//
//  DI+Profile.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit

extension DI.ViewPairs {
    struct Profile : DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "Profile", bundle: nil)

            // Profile
            DI.container.register(ProfileViewControllerType.self) { r -> ProfileViewControllerType in
                return storyboard.instantiateViewController(withIdentifier: "Profile")
            }
            DI.container.register(ProfileViewModel.self) { (r) in
                return ProfileViewModel()
            }
        }
    }
}
