//
//  DI+DIRegistor.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension DI : DIRegistor {
    static func register() {
        Constant.register()
        Model.register()
        Helper.register()
        Service.register()
        ViewPairs.register() // Combine ViewController and ViewModel
    }
}
