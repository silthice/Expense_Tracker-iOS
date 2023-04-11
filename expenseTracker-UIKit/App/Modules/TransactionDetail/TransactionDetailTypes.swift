//
//  TransactionDetailTypes.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/04/2023.
//

import UIKit

protocol TransactionDetailViewType: BaseViewType {
    var transactionId: String? { get set }
    func showLoader()
    func dismissLoader()
}

typealias TransactionDetailViewControllerType = UIViewController & TransactionDetailViewType
