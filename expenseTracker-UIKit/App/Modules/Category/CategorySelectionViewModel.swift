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
    
    
    //MARK: - Outputs
    public weak var view: CategorySelectionViewType? = nil
    
    //MARK: - Dependencies
    
    //MARK: - Constants
    
    //MARK: - Vars
//    var categoryList: BehaviorRelay<[Category]> = BehaviorRelay(value: ExpenseTracker.Enum.EnumIncomeCategory.allCases )
    var categoryList: BehaviorRelay<[Category]> = BehaviorRelay(value: ExpenseTracker.Enum.EnumSpendingCategory.allCases )
    var isEarning: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var categoryId: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    
    //MARK: - Init
    override init() {
        super.init()
    }
    
    //MARK: - Transform
    override func transform() {
        super.transform()
                
        disposeBag.insert(
        )
    }
}

//MARK: - Helper
extension CategorySelectionViewModel {
    
}

//MARK: - API
extension CategorySelectionViewModel {
    
}
