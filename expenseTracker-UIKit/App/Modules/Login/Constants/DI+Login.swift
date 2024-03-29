//
//  DI+Login.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension DI.ViewPairs {
    struct Login : DIRegistor {
        static func register() {
            let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)

            // Login
            DI.container.register(LoginViewControllerType.self) { r -> LoginViewControllerType in
                return storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            }
            DI.container.register(LoginViewModel.self) { (r) in
                return LoginViewModel()
            }
        }
    }
}
