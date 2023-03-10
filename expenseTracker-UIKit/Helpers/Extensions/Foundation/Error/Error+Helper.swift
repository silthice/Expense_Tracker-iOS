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

//static func == (lhs: Error, rhs: NSError) -> Bool {
//    return (lhs as NSError) == rhs
//}
//static func == (lhs: NSError, rhs: Error) -> Bool {
//    return lhs == (rhs as NSError)
//}
