//
//  BasePaginationCollectionViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SwifterSwift

class BasePaginationCollectionViewController<VM>: BaseViewController<VM>, BasePaginationViewType where VM: (BaseViewModel&BasePaginationViewModelType) {
    //MARK: Outlets
    @IBOutlet weak var listView: UICollectionView!
    
    //State
    var dataSource: RxCollectionViewSectionedReloadDataSource<VM.SM>!
    
    //MARK: View Cycle
    override func loadView() {
        super.loadView()
//initializing viewModel in subclass
//        viewModel ??= VM()
//        viewModel.disposed(by: disposeBag)
    }
    override func dispose() {
        super.dispose()
        dataSource = nil
    }
    //MARK: setupView
    override func setupView() {
        super.setupView()
        setupListView()
    }
    
    func removePullToReload() {
        listView.es.removeRefreshHeader()
    }
    
    func removePullToLoadMore() {
        listView.es.removeRefreshFooter()
    }
    
    func setupListView() {
        dataSource = RxCollectionViewSectionedReloadDataSource<VM.SM>(configureCell: self.configureCell)
    }
    
    //MARK: setupTransformInput
    override func setupTransformInput() {
        super.setupTransformInput()
        viewModel.view = self
        viewModel.startReload = self.rx.reload
        viewModel.startLoadMore = self.rx.loadMore
    }
    
    //MARK: subscribe
    override func subscribe() {
        super.subscribe()
        subscribePullToRefresh(didReload: viewModel.didReload, collectionView: self.listView)
        subscribeLoadMore(didLoadMore: viewModel.didLoadMore, collectionView: self.listView)
        subscribeListView(sections: viewModel.sections)
    }
    
    func subscribeListView(sections: Driver<[VM.SM]>) {
        sections
            .asObservable()
            .bind(to: self.listView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
    }
    
    func configureCell(ds: CollectionViewSectionedDataSource<VM.SM>, tv: UICollectionView, ip: IndexPath, item: VM.SM.Item) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
}

