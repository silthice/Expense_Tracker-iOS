//
//  Double+ToString.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Double {
    func toString() -> String {
        if self != nil {
            return "\(self)"
        }
        else {
            return "0"
        }
    }
    
    func roundOffToString(toPlaces places: Int) -> String {
        return String(format: "%.\(places)f", self)
    }
    
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
