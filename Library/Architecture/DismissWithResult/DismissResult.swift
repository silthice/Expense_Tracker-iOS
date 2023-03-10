//
//  DismissResult.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

class DismissResult: NSObject {
    var result: Any?
    var identifier: Any?
    
    init(result: Any?, identifier: Any?) {
        self.result = result
        self.identifier = identifier
    }
    
    static var none: DismissResult {
        return DismissResult(result: nil, identifier: nil)
    }
}
