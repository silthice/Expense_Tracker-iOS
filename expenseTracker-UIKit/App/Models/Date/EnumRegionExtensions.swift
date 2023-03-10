//
//  EnumRegionExtensions.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import SwiftDate

extension EnumRegion {
    var now: DateInRegion {
        let dateProvider = DI.resolver.resolve(DateProviderType.self)!
        return DateInRegion(dateProvider.now.date, region: self.region)
    }
    static var local: EnumRegion {
        let buildConfig = DI.resolver.resolve(BuildConfigType.self)!
        return buildConfig.localRegion
    }
}
