//
//  CategorySelectionViewModel.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/04/2023.
//

import Foundation
import RxSwift
import RxCocoa
import SwifterSwift

final class CategorySelectionViewModel: BaseViewModel {
    
    //MARK: - Inputs
    var categoryCellDidSelected: Driver<Category> = .never()
    
    //MARK: - Outputs
    public weak var view: CategorySelectionViewType? = nil
    
    //MARK: - Dependencies
    
    //MARK: - Constants
    
    //MARK: - Vars
    var categoryList: BehaviorRelay<[Category]> = BehaviorRelay(value: ExpenseTracker.Enum.EnumSpendingCategory.allCases )
    var isEarning: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var categoryId: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    var tempCategoryId: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    var originalTransaction: BehaviorRelay<Transaction?> = BehaviorRelay(value: nil)
    
    //MARK: - Init
    override init() {
        super.init()
    }
    
    //MARK: - Transform
    override func transform() {
        super.transform()
        
        let categoryCellDidSelected = categoryCellDidSelected
            .do(onNext: { category in
                self.categoryId.accept(category.getCategoryRawValue)
                self.tempCategoryId.accept(category.getCategoryRawValue)
                self.view?.updateSelection(category, self.isEarning.value)
            })
                
        disposeBag.insert(
            categoryCellDidSelected.drive()
        )
    }
}

//MARK: - Helper
extension CategorySelectionViewModel {
    
}

//MARK: - API
extension CategorySelectionViewModel {
    
}
