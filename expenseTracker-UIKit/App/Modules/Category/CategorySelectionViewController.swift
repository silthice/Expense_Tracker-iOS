
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
    @IBOutlet weak var categoryTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    //MARK: - Constants
    let categoryCollectionViewCellIdentifier: String = "CategoryCollectionViewCell"
    
    //MARK: - Vars
    var isEarning: Bool?
    var categoryId: Int?
    var tempCategoryId: Int?
    var tempIsEarning: Bool?
    var originalTransaction: Transaction?
    var delegate: TransactionDetailDelegate!
    
    //MARK: - Dependencies
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(CategorySelectionViewModel.self)!
        viewModel.isEarning.accept(self.isEarning ?? false)
        viewModel.categoryId.accept(self.categoryId ?? 0)
        viewModel.tempCategoryId.accept(self.categoryId ?? 0)
        viewModel.originalTransaction.accept(self.originalTransaction ?? nil)
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
        viewModel.categoryCellDidSelected = categoryCollectionView.rx.modelSelected(Category.self).asDriver()
    }
    
    override func subscribe() {
        super.subscribe()
        
        let categoryCollectionDelegate = categoryCollectionView.rx.setDelegate(self)
        
        let categoryList = viewModel.categoryList.bind(to: categoryCollectionView.rx.items(cellIdentifier: categoryCollectionViewCellIdentifier)){ index, category, cell in
            if let categoryCell = cell as? CategoryCollectionViewCell {
                categoryCell.setupView(category: category, isEarning: self.categoryTypeSegmentedControl.selectedSegmentIndex == 0 ? false : true, categoryId: self.viewModel.categoryId.value)
            }
        }
        
        categoryTypeSegmentedControl.rx.selectedSegmentIndex
            .skip(1)
            .subscribe (
            onNext: { index in
            self.viewModel.categoryList.accept(index == 0 ? ExpenseTracker.Enum.EnumSpendingCategory.allCases : ExpenseTracker.Enum.EnumIncomeCategory.allCases)
            self.viewModel.isEarning.accept(index == 0 ? false : true)
            
            if self.viewModel.isEarning.value == self.tempIsEarning {
                
                if let _ = self.tempIsEarning {
                    self.viewModel.categoryId.accept(self.viewModel.tempCategoryId.value)
                } else {
                    self.viewModel.categoryId.accept(self.viewModel.categoryId.value)
                }
            } else {
                self.viewModel.categoryId.accept(0)
            }
        })
        
        disposeBag.insert(
            categoryCollectionDelegate,
            categoryList
        )
    }
    
}

//MARK: - Helper
extension CategorySelectionViewController {
    func setupUI() {
        
        if let isEarning = self.tempIsEarning {
            self.categoryTypeSegmentedControl.selectedSegmentIndex = isEarning ? 1 : 0
        }
    }
    
    func setupText() {
        
    }
}

//MARK: - <CategorySelectionViewType>
extension CategorySelectionViewController: CategorySelectionViewType {
    func updateSelection(_ category: Category, _ isEarning: Bool) {
        self.viewModel.categoryId.accept(category.getCategoryRawValue)
        self.viewModel.tempCategoryId.accept(category.getCategoryRawValue)
        self.categoryCollectionView.reloadData()
        self.delegate.updateCategorySelection(isEarning: isEarning, category: category)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.dismiss(animated: true)
        })
    }
}

//MARK: - CollectionView Delegate
extension CategorySelectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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
