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
    
    //MARK: - Outputs
    public weak var view: TransactionDetailViewType? = nil
    
    //MARK: - Dependencies
    let apiService = APIService()
    @Injected private var ETKeychain: ETKeyChainType
    
    //MARK: - Constants
    
    //MARK: - Vars
    var transactionId = BehaviorRelay<String?>(value: "")
    var transactionDetail: BehaviorRelay<Transaction?> = BehaviorRelay(value: nil)
    
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
                
        disposeBag.insert(
            getTransactionDetail.drive()
        )
    }
}

//MARK: - Helper
extension TransactionDetailViewModel {
    func handleResponse(res: GetTransactionDetailResponse) {
        if let errMsg = res.errMsg {
            print("giap check res error", errMsg)
            return
        }
        
        if res.status {
            self.transactionDetail.accept(res.transactionDetail)
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
            self.view?.dismissLoader()
        }
    }
}
