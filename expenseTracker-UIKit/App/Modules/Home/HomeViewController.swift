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
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var overviewStackViewContainer: UIStackView!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var netBalanceLabel: UILabel!
    @IBOutlet weak var availableBalanceLabel: UILabel!
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var spentTitleLabel: UILabel!
    @IBOutlet weak var earnedLabel: UILabel!
    @IBOutlet weak var earnedTitleLabel: UILabel!
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var recentTransactionTitleLabel: UILabel!
    @IBOutlet weak var recentTransactionCollectionView: UICollectionView!
    @IBOutlet weak var recentTransactionCollectionViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Constants
    let transactionCollectionViewCellIdentifier: String = "TransactionCollectionViewCell"
    //MARK: - Vars
    
    //MARK: - Dependencies
    @Injected private var ETKeychain: ETKeyChainType
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
        viewModel.overviewDidTap = overviewButton.rx.tap.asDriver()
    }
    
    override func subscribe() {
        super.subscribe()
        let recentTransactionDelegate = recentTransactionCollectionView.rx.setDelegate(self)
        
        let recentTransactionList = viewModel.recentTransactionList.bind(to: recentTransactionCollectionView.rx.items(cellIdentifier: transactionCollectionViewCellIdentifier)){ index, transaction, cell in
            if let transactionCell = cell as? TransactionCollectionViewCell {
                transactionCell.setupView(transaction: transaction)
                transactionCell.rx.cellDidTap.map({
                    self.routeToTransactionDetail(transaction: transaction)
                }).drive().disposed(by: transactionCell.disposeBag)
                
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
        self.view.backgroundColor = ExpenseTracker.Colors.grey_EEEEEE
        imageViewContainer.roundCorners(.allCorners, radius: 90)
        overviewStackViewContainer.roundCorners(.allCorners, radius: 10)
        overviewStackViewContainer.backgroundColor = ExpenseTracker.Colors.teal_2FEBEB
        
        netBalanceLabel.textColor = .white
        availableBalanceLabel.textColor = .white
        spentLabel.textColor = .white
        spentTitleLabel.textColor = .white
        earnedLabel.textColor = .white
        earnedTitleLabel.textColor = .white
        
        overviewButton.setTitleColor(.white, for: .normal)
    }
    
    func setupText() {
        helloLabel.text = "Hello,"
        displayNameLabel.text = ETKeychain.getLoginName()?.capitalized ?? ""
        recentTransactionTitleLabel.text = "Recent Transaction(s)"
    }
}

//MARK: - <HomeViewType>
extension HomeViewController: HomeViewType {
    func routeToOverview() {
        print("giap check route to overview")
    }
    
    func routeToTransactionDetail(transaction: Transaction) {
        print("giap check route to transaction detail", transaction)
    }
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
