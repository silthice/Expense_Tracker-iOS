//
//  OptionalString+IsNilOrEmpty.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty : Bool {
        switch self {
        case .some(let value):
            return value.isNilOrEmpty
        case _:
            return true
        }
    }
    
    var isNotNilOrEmpty: Bool { return isNilOrEmpty == false }
    
    var orEmptyReplacement : String {
        switch self {
        case .some(let value):
            return value.orEmptyReplacement
        case _:
            return String.emptyReplacement
        }
    }
    var orEmpty : String {
        switch self {
        case .some(let value):
            return value
        case _:
            return ""
        }
    }
}

