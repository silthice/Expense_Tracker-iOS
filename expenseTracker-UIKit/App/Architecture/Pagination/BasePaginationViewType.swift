//
//  BasePaginationViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

protocol BasePaginationViewType: BaseViewType,  ReloadItemsViewControllerType, LoadMoreItemsViewControllerType {
    func removePullToReload()
    func removePullToLoadMore()
}
