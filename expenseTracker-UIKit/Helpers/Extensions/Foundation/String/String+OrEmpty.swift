//
//  toDictionary+OrEmpty.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension String {
    static var emptyReplacement: String = "-"
}

extension String {
    var orEmptyReplacement:String {
        if self.count == 0 {
            return String.emptyReplacement
        } else {
            return self
        }
    }
    var orEmpty: String {
        if self.count == 0 {
            return ""
        } else {
            return self
        }
    }
}
