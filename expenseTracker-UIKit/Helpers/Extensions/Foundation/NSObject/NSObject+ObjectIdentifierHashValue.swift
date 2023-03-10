//
//  NSObject+ObjectIdentifierHashValue.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension NSObject {
    var objectIdentifierHashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
}
