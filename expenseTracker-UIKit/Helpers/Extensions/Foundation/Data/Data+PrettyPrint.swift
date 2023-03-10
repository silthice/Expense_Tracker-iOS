//
//  Data+PrettyPrint.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Data {
    func prettyPrintedJSONString() throws -> String { /// NSString gives us a nice sanitized debugDescription
        let object = try JSONSerialization.jsonObject(with: self, options: [])
        let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
        let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        return (prettyPrintedString ?? NSString()) as String
    }
}
