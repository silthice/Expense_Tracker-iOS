//
//  DI+ViewPairs.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import SwifterSwift
import Swinject

extension DI {
    struct ViewPairs: DIRegistor {}
}

extension DI.ViewPairs {
    static func register() {
        Login.register()
        SignUp.register()
    }
}

