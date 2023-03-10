//
//  BaseNavigationChildViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

@objc protocol BaseNavigationChildViewController {
    @objc optional func willShowInNavigationController(navigationController: UINavigationController, animated: Bool)
    @objc optional var isNavigationBarHidden: Bool { get }
}

