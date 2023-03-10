//
//  DateProviderType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import SwiftDate

protocol DateProviderType {
    var now: DateInRegion { get }
}
