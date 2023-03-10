//
//  ReloadItemsViewControllerType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - Reload

protocol ReloadItemsViewControllerType:DisposeBagHolderType {
    var reload: PublishSubject<Void> { get }
    func subscribePullToRefresh(didReload: Driver<Void>, tableView: UITableView)
    func subscribePullToRefresh(didReload: Driver<Void>, scrollView: UIScrollView)
    func subscribePullToRefresh(didReload: Driver<Void>, collectionView: UICollectionView)
}

extension Reactive where Base : ReloadItemsViewControllerType {
    var reload: Driver<Void> {
        return base.reload.asDriverOnErrorJustComplete()
    }
}
