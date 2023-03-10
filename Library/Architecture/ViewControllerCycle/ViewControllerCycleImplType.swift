//
//  ViewControllerCycleImplType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

@objc protocol ViewControllerCycleImplType {
    @objc var viewWillAppearCount:Int { set get }
    @objc var viewDidAppearCount:Int { set get }
    @objc var isViewVisible: Bool { set get }
}


