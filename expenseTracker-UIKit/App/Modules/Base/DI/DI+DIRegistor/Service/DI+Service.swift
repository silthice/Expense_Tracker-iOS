//
//  DI+Service.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension DI {
    struct Service : DIRegistor {
        static func register() {
            
//            //MARK: Common - Call Common API
//            DI.container.register(CommonServiceType.self) { r -> CommonServiceType in
//                return CommonService()
//            }.inObjectScope(.container)
            
            //MARK: Member - Call User API
//            DI.container.register(UserServiceType.self) { r -> UserServiceType in
//                return UserService()
//            }.inObjectScope(.container)
        }
    }
}
