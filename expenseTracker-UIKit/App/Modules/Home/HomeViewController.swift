//
//  HomeViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxBiBinding

class HomeViewController: BaseViewController<HomeViewModel> {
    //MARK: - IBOutlets
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var overviewStackViewContainer: UIStackView!
    @IBOutlet weak var recentTransactionCollectionView: UICollectionView!
    @IBOutlet weak var recentTransactionCollectionViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Constants
    let transactionCollectionViewCellIdentifier: String = "TransactionCollectionViewCell"
    //MARK: - Vars
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(HomeViewModel.self)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//                navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        
        self.recentTransactionCollectionViewHeightConstraint.constant = self.recentTransactionCollectionView.contentSize.height + 10
    }
    
    override func setupView() {
        super.setupView()
        self.setupUI()
        self.setupText()
        
        recentTransactionCollectionView.register(
            UINib(nibName: transactionCollectionViewCellIdentifier, bundle: Bundle.main),
            forCellWithReuseIdentifier: transactionCollectionViewCellIdentifier
        )
    }
    
    override func setupTransformInput() {
        super.setupTransformInput()
        
        viewModel.view = self
        viewModel.startLoad = self.rx.viewWillAppear
    }
    
    override func subscribe() {
        super.subscribe()
        let recentTransactionDelegate = recentTransactionCollectionView.rx.setDelegate(self)
        
        let recentTransactionList = viewModel.recentTransactionList.bind(to: recentTransactionCollectionView.rx.items(cellIdentifier: transactionCollectionViewCellIdentifier)){ index, transaction, cell in
            if let transactionCell = cell as? TransactionCollectionViewCell {
                transactionCell.setupView(transaction: transaction)
                
            }
        }
        
        disposeBag.insert(
            recentTransactionDelegate,
            recentTransactionList
        )
    }
}


//MARK: - Helper
extension HomeViewController {
    func setupUI() {
//        self.view.backgroundColor = .lightGray
        
        self.view.setGradientColor(view: self.view, topColor: ExpenseTracker.Colors.teal_003C40, bottomColor: ExpenseTracker.Colors.teal_00686B)
        self.view.opacity = .custom(value: 0.95)
        imageViewContainer.roundCorners(.allCorners, radius: 90)
        overviewStackViewContainer.roundCorners(.allCorners, radius: 10)
    }
    
    func setupText() {
    }
}

//MARK: - <HomeViewType>
extension HomeViewController: HomeViewType {
    
}

//MARK: - CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellHeight = CGFloat(50)
        var cellWidth = collectionView.width
                
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
}
