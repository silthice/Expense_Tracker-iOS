
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
            .subscribe (
            onNext: { index in
            self.viewModel.categoryList.accept(index == 0 ? ExpenseTracker.Enum.EnumSpendingCategory.allCases : ExpenseTracker.Enum.EnumIncomeCategory.allCases)
            self.viewModel.isEarning.accept(index == 0 ? false : true)
            
            if let tempIsEarning = self.tempIsEarning {
                let categoryId = self.viewModel.isEarning.value == tempIsEarning ?
                    self.viewModel.tempCategoryId.value : 0
                self.viewModel.categoryId.accept(categoryId)
            } else {
                let categoryId = self.viewModel.isEarning.value == self.isEarning ?
                    self.viewModel.tempCategoryId.value : 0
                self.viewModel.categoryId.accept(categoryId)
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
        
        if let tempIsEarning = self.tempIsEarning {
            self.categoryTypeSegmentedControl.selectedSegmentIndex = tempIsEarning ? 1 : 0
        } else {
            self.categoryTypeSegmentedControl.selectedSegmentIndex = (self.isEarning ?? false) == true ? 1 : 0
        }
    }
    
    func setupText() {
        
    }
}

//MARK: - <CategorySelectionViewType>
extension CategorySelectionViewController: CategorySelectionViewType {
    func updateSelection(_ category: Category, _ isEarning: Bool) {
        self.categoryCollectionView.reloadData()
        self.delegate.updateCategorySelection(isEarning: isEarning, category: category)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
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
