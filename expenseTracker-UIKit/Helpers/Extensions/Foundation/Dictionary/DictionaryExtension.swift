//
//  DictionaryExtension.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension Dictionary {
    public func sortedJsonData(prettify: Bool = false, withoutEscapingSlashes: Bool = false) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        var options = JSONSerialization.WritingOptions()
        options.insert(.sortedKeys)
        if prettify {
            options.insert(.prettyPrinted)
        }
        if withoutEscapingSlashes {
            if #available(iOS 13.0, *) {
                options.insert(.withoutEscapingSlashes)
            } else {
                //FIXME: may cause invalid signature if not handled
            }
        }
        
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
}
