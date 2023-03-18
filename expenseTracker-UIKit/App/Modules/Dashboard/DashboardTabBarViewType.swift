//
//  DashboardTabBarViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

extension ExpenseTracker.Enum {
    enum EnumDashboardAction {
        case home
        case addTransaction
        case profile
    }
}

protocol DashboardTabBarViewType {
    var dashboardAction: ExpenseTracker.Enum.EnumDashboardAction { set get }
    var dashboardActionValue: String { set get }
}

typealias DashboardTabBarControllerType = UITabBarController & DashboardTabBarViewType
