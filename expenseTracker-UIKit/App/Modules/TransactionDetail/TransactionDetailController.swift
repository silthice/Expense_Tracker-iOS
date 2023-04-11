//
//  TransactionDetailController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/04/2023.
//

import UIKit
import RxSwift
import RxCocoa

class TransactionDetailViewController: BaseViewController<TransactionDetailViewModel> {
    //MARK: - IBOutlets
    //MARK: - Constants
    //MARK: - Vars
    //MARK: - Dependencies
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(TransactionDetailViewModel.self)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        if let tabBar = self.tabBarController?.tabBar {
                for subview in tabBar.subviews {
                    if subview is UIButton {
                        subview.isHidden = true
                    }
                }
            }
    }
    
    override func setupView() {
        super.setupView()
        self.setupUI()
        self.setupText()
    }
    
    override func setupTransformInput() {
        super.setupTransformInput()
        
        viewModel.view = self
        viewModel.startLoad = self.rx.viewWillAppear
    }
    
    override func subscribe() {
        super.subscribe()
        
        disposeBag.insert(
        )
    }
    
}

//MARK: - Helper
extension TransactionDetailViewController {
    func setupUI() {
        
    }
    
    func setupText() {
        
    }
}

//MARK: - <TransactionDetailViewType>
extension TransactionDetailViewController: TransactionDetailViewType {
    
}
