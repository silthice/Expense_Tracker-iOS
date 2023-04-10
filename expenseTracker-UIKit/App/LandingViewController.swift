//
//  LandingViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/03/2023.
//

import UIKit
import SwifterSwift

class LandingViewController: UIViewController {
    @Injected private var ETKeychain: ETKeyChainType
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.redirect()
    }

}

extension LandingViewController {
    private func redirect() {
        if let _ = ETKeychain.getBearerToken() {
            let screen = DI.resolver.resolve(DashboardTabBarControllerType.self)!
            let vc = UINavigationController(rootViewController: screen)
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } else {
            let screen = DI.resolver.resolve(LoginViewControllerType.self)!
            let vc = UINavigationController(rootViewController: screen)
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
}
