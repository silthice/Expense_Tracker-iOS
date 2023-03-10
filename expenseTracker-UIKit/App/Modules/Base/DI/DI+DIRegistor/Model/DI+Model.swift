//
//  DI+Model.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
//import SwiftyUserDefaults

extension DI {
    struct Model : DIRegistor {
        static func register() {
            
            //MARK: Date
//            DI.container.register(DateProviderType.self) { r -> DateProviderType in
//                return DateProvider()
//            }.inObjectScope(.container)
            
            //MARK: Persistency
//            DI.container.register(UserDefaults.self) { r -> UserDefaults in
//                return SwiftyUserDefaults.Defaults
//            }.inObjectScope(.container)
            
        }
    }
}
