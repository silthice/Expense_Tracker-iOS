//
//  CategorySelectionTypes.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/04/2023.
//

import UIKit

protocol CategorySelectionViewType: BaseViewType {
    var isEarning: Bool? { get set }
    var categoryId: Int? { get set }
    var tempCategoryId: Int? { get set }
    var tempIsEarning: Bool? { get set }
    var originalTransaction: Transaction? { get set }
    var delegate: TransactionDetailDelegate! { get set }
    func updateSelection(_ category: Category, _ isEarning: Bool)
}

typealias CategorySelectionViewControllerType = UIViewController & CategorySelectionViewType
