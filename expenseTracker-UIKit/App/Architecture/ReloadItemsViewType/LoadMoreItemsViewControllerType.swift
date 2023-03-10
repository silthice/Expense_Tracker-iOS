//
//  LoadMoreItemsViewControllerType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoadMoreItemsViewControllerType: DisposeBagHolderType {
    var loadMore: PublishSubject<Void> { get }
    func subscribeLoadMore(didLoadMore: Driver<Bool>, tableView: UITableView)
    func subscribeLoadMore(didLoadMore: Driver<Bool>, collectionView: UICollectionView)
}

extension Reactive where Base : LoadMoreItemsViewControllerType {
    var loadMore: Driver<Void> {
        return base.loadMore.asDriverOnErrorJustComplete()
    }
}
