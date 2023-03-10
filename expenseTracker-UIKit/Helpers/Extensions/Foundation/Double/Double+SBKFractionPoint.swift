//
//  Double+SBKFraction.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

//* MARK: - SBK Fraction Calculation
extension Double {
    func decimalCount() -> Int {
        if self == Double(Int(self)) {
            return 0
        }

        let integerString = String(Int(self))
        let doubleString = String(Double(self))
        let decimalCount = doubleString.count - integerString.count - 1

        return decimalCount
    }
    
    func toSBKPointFraction() -> String {
        if fabs(self).decimalCount() > 1 {
            if self > 0 {
                let lhs = self - 0.25
                let rhs = self + 0.25
                let lhsString = String(format: "%g", lhs)
                let rhsString = String(format: "%g", rhs)
                return "\(lhsString)/\(rhsString)"
            } else {
                let lhs = fabs(self) - 0.25
                let rhs = fabs(self) + 0.25
                let lhsString = String(format: "%g", lhs)
                let rhsString = String(format: "%g", rhs)
                return "-\(lhsString)/\(rhsString)"
            }
        }
        else {
            return String(format: "%g", self)
        }
    }
}
