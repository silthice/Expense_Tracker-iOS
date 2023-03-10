//
//  String+IsNilOrEmpty.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension String {
    var isNilOrEmpty:Bool {
        if self.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    var isNotEmpty: Bool { return isNilOrEmpty == false }
}
