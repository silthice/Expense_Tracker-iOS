//
//  DateProvider.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import SwiftDate

class DateProvider : DateProviderType {
    static let shared = DateProvider()
    var date: Date {
        return Date()
    }
    var now: DateInRegion {
        return DateInRegion(date, region: EnumRegion.local.region)
    }
    
    var yesterday: DateInRegion {
        return now
    }
}
