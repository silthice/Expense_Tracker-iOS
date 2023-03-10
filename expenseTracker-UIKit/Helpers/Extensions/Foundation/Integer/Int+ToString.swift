//
//  Int+ToString.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Int {
    func toString() -> String {
        if self != nil {
            return "\(self)"
        }
        else {
            return "0"
        }
    }
}
