//
//  LandingViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/03/2023.
//

import UIKit
import SwifterSwift

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("giap check landing page")
        self.redirect()
    }

}

extension LandingViewController {
    private func redirect() {
        //Add Here
        //If login redirect to main tab
        //Else redirect to login/sign up
        let screen = DI.resolver.resolve(LoginViewControllerType.self)!
        let vc = UINavigationController(rootViewController: screen)
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
