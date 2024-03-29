//
//  DI+Constant.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension DI {
    struct Constant : DIRegistor {
        static func register() {
            //MARK: BuildConfig
            DI.container.register(BuildConfigType.self) { r in
                return BaseBuildConfig()
            }.inObjectScope(.container)
        }
    }
}
