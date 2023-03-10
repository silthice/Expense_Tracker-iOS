//
//  Date+Calculation.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Date {
    func addOrSubtractDay(day:Int) -> String {
      let date = Calendar.current.date(byAdding: .day, value: day, to: Date())!
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df.string(from: date)

    }

    func addOrSubtractMonth(month:Int) -> String {
        let date = Calendar.current.date(byAdding: .month, value: month, to: Date())!
          let df = DateFormatter()
          df.dateFormat = "yyyy-MM-dd"
          return df.string(from: date)
    }

}
