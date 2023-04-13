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
}

typealias CategorySelectionViewControllerType = UIViewController & CategorySelectionViewType
