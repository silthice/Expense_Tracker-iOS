//
//  Error+Helper.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Error {
    var error: NSError {
        return self as NSError
    }
}
