//
//  CategorySelectionViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/04/2023.
//

import UIKit
import RxSwift
import RxCocoa

class CategorySelectionViewController: BaseViewController<CategorySelectionViewModel> {
    
    //MARK: - IBOutlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    //MARK: - Constants
    let categoryCollectionViewCellIdentifier: String = "CategoryCollectionViewCell"
    
    //MARK: - Vars
    var isEarning: Bool?
    var categoryId: Int?
    
    //MARK: - Dependencies
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(CategorySelectionViewModel.self)!
        viewModel.isEarning.accept(self.isEarning ?? false)
        viewModel.categoryId.accept(self.categoryId ?? 0)
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
    }
    
    override func setupView() {
        super.setupView()
        self.setupUI()
        self.setupText()
        
        categoryCollectionView.register(
            UINib(nibName: categoryCollectionViewCellIdentifier, bundle: Bundle.main),
            forCellWithReuseIdentifier: categoryCollectionViewCellIdentifier
        )
    }
    
    override func setupTransformInput() {
        super.setupTransformInput()
        
        viewModel.view = self
        viewModel.startLoad = self.rx.viewWillAppear
    }
    
    override func subscribe() {
        super.subscribe()
        
        let categoryCollectionDelegate = categoryCollectionView.rx.setDelegate(self)
        
        let categoryList = viewModel.categoryList.bind(to: categoryCollectionView.rx.items(cellIdentifier: categoryCollectionViewCellIdentifier)){ index, category, cell in
            if let categoryCell = cell as? CategoryCollectionViewCell {
                categoryCell.setupView(category: category, isEarning: self.viewModel.isEarning.value, categoryId: self.viewModel.categoryId.value)
//                transactionCell.rx.cellDidTap.map({
//                    self.routeToTransactionDetail(transaction: transaction)
//                }).drive().disposed(by: transactionCell.disposeBag)
                
            }
        }
        
        disposeBag.insert(
            categoryCollectionDelegate,
            categoryList
        )
    }
    
}

//MARK: - Helper
extension CategorySelectionViewController {
    func setupUI() {
        
    }
    
    func setupText() {
        
    }
}

//MARK: - <CategorySelectionViewType>
extension CategorySelectionViewController: CategorySelectionViewType {
    
}

//MARK: - CollectionView Delegate
extension CategorySelectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(horizontal: 5, vertical: 0)
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellHeight = CGFloat(80)
//        let cellWidth = CGFloat(80)
//
//        return CGSize(width: cellWidth, height: cellHeight)
        
        let noOfCellsInRow = 4

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
}
