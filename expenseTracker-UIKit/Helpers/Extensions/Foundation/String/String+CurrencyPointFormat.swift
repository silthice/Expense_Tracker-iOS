//
//  String+CurrencyPointFormat.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension String {
    
    var toDouble: Double {
        let usLocale = Locale(identifier: "en_US")
        
        if let value = self.double(locale: usLocale) {
            return value
        }
        return 0
    }

    var currencyFormat:String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.groupingSize = 3
        currencyFormatter.locale = Locale(identifier: "en_US")

        let dbstring = self.toDouble
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.roundingMode = .down
        
        let number = NSNumber(value: dbstring)
        return currencyFormatter.string(from: number).unwrapped(or: self)
    }
    
    var pointFormat:String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.groupingSize = 3
        currencyFormatter.locale = Locale(identifier: "en_US")

        let dbstring = self.toDouble
        currencyFormatter.maximumFractionDigits = 0
        currencyFormatter.minimumFractionDigits = 0
        currencyFormatter.roundingMode = .down
        
        let number = NSNumber(value: dbstring)
        return currencyFormatter.string(from: number).unwrapped(or: self)
    }
    
    var removePointFormat:String {
        return self.replacingOccurrences(of: ",", with: "")
    }

}
