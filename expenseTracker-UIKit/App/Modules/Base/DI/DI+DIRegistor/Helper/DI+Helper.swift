//
//  DI+Helper.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension DI {
    struct Helper : DIRegistor {
        static func register() {
            
            // URLTransformType
//            DI.container.register(URLTransformType.self) { r -> URLTransformType in
//                return URLTransform()
//            }.inObjectScope(.container)
            
        }
        
    }
}

