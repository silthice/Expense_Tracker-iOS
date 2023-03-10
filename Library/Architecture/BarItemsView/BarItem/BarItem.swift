//
//  BarItem.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

class BarItem: Equatable {
    var id: String
    
    var closure: ((UIViewController)->())? = nil
    
    weak var viewController: UIViewController? = nil
    
    static func == (lhs: BarItem, rhs: BarItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(id: String) {
        self.id = id
    }
    
    func createBarButtonItem() -> UIBarButtonItem? {
        return nil
    }
    
    @objc func performAction(sender: Any?) {
        if let viewController = viewController {
            AppUtils.vibrateGenerator()
            closure?(viewController)
        }
    }
}
