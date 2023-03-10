//
//  BarItemsViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

protocol BarItemsViewType: class {
    
    var leftBarItem: BarItem? { set get }
    
    var leftBarItems:[BarItem] { set get }
    
    var rightBarItem: BarItem? { set get }
    
    var rightBarItems:[BarItem] { set get }
    
    func updateRightBarButtons()
    
    func updateLeftBarButtons()
}

