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
    func setupText()
    func dismiss()
    func deleteTransaction()
    func selectCategory()
    func selectDateTime()
    func save()
    var delegate: HomeDelegate! { get set }
}

typealias TransactionDetailViewControllerType = UIViewController & TransactionDetailViewType
