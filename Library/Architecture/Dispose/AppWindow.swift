//
//  AppWindow.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

class AppWindow: UIWindow {
    override var rootViewController: UIViewController? {
        didSet {
            oldValue?.dispose()
        }
    }
}