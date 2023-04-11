//
//  HomeViewTypes.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit
import RxSwift
import RxCocoa


protocol HomeViewType: BaseViewType {
    func routeToOverview()
    func routeToTransactionDetail(transaction: Transaction)
}

typealias HomeViewControllerType = UIViewController & HomeViewType

