//
//  DI+SignUp.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/03/2023.
//

import UIKit

extension DI.ViewPairs {
    struct SignUp : DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "SignUpViewController", bundle: nil)

            // Login
            DI.container.register(SignUpViewControllerType.self) { r -> SignUpViewControllerType in
                return storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
            }
            DI.container.register(SignUpViewModel.self) { (r) in
                return SignUpViewModel()
            }
        }
    }
}
