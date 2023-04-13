//
//  TransactionDetailModel.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/04/2023.
//

import Foundation
import RxSwift
import RxCocoa
import SwifterSwift

final class TransactionDetailViewModel: BaseViewModel {
    
    //MARK: - Inputs
    var backDidTap : Driver<Void> = .never()
    var deleteDidTap : Driver<Void> = .never()
    var categoryDidTap : Driver<Void> = .never()
    var dateTimeDidTap : Driver<Void> = .never()
    var saveDidTap : Driver<Void> = .never()
    
    
    //MARK: - Outputs
    public weak var view: TransactionDetailViewType? = nil
    
    //MARK: - Dependencies
    let apiService = APIService()
    @Injected private var ETKeychain: ETKeyChainType
    
    //MARK: - Constants
    
    //MARK: - Vars
    var transactionId = BehaviorRelay<String?>(value: "")
    var transactionDetail: BehaviorRelay<Transaction?> = BehaviorRelay(value: nil)
    var selectedCategoryId: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    
    //MARK: - Init
    override init() {
        super.init()
    }
    
    //MARK: - Transform
    override func transform() {
        super.transform()
        
        let getTransactionDetail = self.startLoad
            .do(onNext: {
                self.view?.showLoader()
                self.getTransactionDetail(t_user_id: self.ETKeychain.getUserId() ?? "", t_id: self.transactionId.value ?? "")
            })
                
       let backDidTap = backDidTap
            .do(onNext: {
                self.view?.dismiss()
            })
                
       let deleteDidTap = deleteDidTap
            .do(onNext: {
                self.view?.deleteTransaction()
            })
                
       let categoryDidTap = categoryDidTap
            .do(onNext: {
                self.view?.selectCategory()
            })
        
       let dateTimeDidTap = dateTimeDidTap
            .do(onNext: {
                self.view?.selectDateTime()
            })
        
       let saveDidTap = saveDidTap
            .do(onNext: {
                self.view?.save()
            })
                
        disposeBag.insert(
            getTransactionDetail.drive(),
            backDidTap.drive(),
            deleteDidTap.drive(),
            categoryDidTap.drive(),
            dateTimeDidTap.drive(),
            saveDidTap.drive()
        )
    }
}

//MARK: - Helper
extension TransactionDetailViewModel {
    func handleResponse(res: GetTransactionDetailResponse) {
        if let errMsg = res.errMsg {
            print("giap check get res error", errMsg)
            return
        }
        
        if res.status {
            self.transactionDetail.accept(res.transactionDetail)
//            self.selectedCategoryId.accept(res.transactionDetail?.t_cat_id ?? 0)
            self.view?.setupText()
        }
    }
    
    func handleSaveResponse(res: SaveTransactionDetailResponse) {
        if let errMsg = res.errMsg {
            print("giap check save res error", errMsg)
            return
        }
        
        if res.status {
            print("giap check save res")
        }
    }
}

//MARK: - API
extension TransactionDetailViewModel {
    private func getTransactionDetail(t_user_id: String, t_id: String) {
//        self.view?.showLoader()
        let request = GetTransactionDetailRequest(t_user_id: t_user_id, t_id: t_id)
        
        apiService.getTransactionDetail(getTransactionDetailRequest: request) { response in
            switch response {
            case .success(let value):
                self.handleResponse(res: value)
            case .failure(let error):
                print("giap check fail", error)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                self.view?.dismissLoader()
            })
        }
    }
    
    func saveTransactionDetail(t_user_id: String, t_id: String, t_cat_id: Int, t_amt: Double, t_r_id: String, t_is_income: Bool) {
        self.view?.showLoader()
        let request = SaveTransactionDetailRequest(t_user_id: t_user_id, t_id: t_id, t_cat_id: t_cat_id, t_amt: t_amt, t_r_id: t_r_id, t_is_income: t_is_income)
        
        apiService.editTransactionDetail(saveTransactionDetailRequest: request) { response in
            switch response {
            case .success(let value):
                self.handleSaveResponse(res: value)
            case .failure(let error):
                print("giap check fail", error)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                self.view?.dismissLoader()
                self.view?.dismiss()
                self.view?.delegate.reload()
            })
        }
    }
}
