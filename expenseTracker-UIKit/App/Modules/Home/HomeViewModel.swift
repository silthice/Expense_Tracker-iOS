//
//  HomeViewModel.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import Foundation
import RxSwift
import RxCocoa
import SwifterSwift

final class HomeViewModel: BaseViewModel {
    
    //MARK: - Inputs
    var overviewDidTap: Driver<Void> = .never()
    var viewAllDidtap: Driver<Void> = .never()
    
    //MARK: - Outputs
    public weak var view: HomeViewType? = nil
    
    //MARK: - Dependencies
    let apiService = APIService()
    @Injected private var ETKeychain: ETKeyChainType
    
    //MARK: - Constants
    //MARK: - Vars
    var recentTransactionList: BehaviorRelay<[Transaction]> = BehaviorRelay(value: [])
    
    //MARK: - Init
    override init() {
        super.init()
    }
    
    override func dispose() {
        super.dispose()
    }
    
    //MARK: - Transform
    override func transform() {
        super.transform()
        
        let getRecentTransactions = self.startLoad
            .do(onNext: {
                self.getRecentTransactions(t_user_id: self.ETKeychain.getUserId() ?? "")
            })
                
        let overviewDidTap = self.overviewDidTap
            .do(onNext: {
                self.view?.routeToOverview()
            })
                
        let viewAllDidtap = self.viewAllDidtap
            .do(onNext: {
                self.view?.routeToAllTransaction()
            })
                
        disposeBag.insert(
            getRecentTransactions.drive(),
            overviewDidTap.drive(),
            viewAllDidtap.drive()
        )
    }
}

extension HomeViewModel {
    
    func handleResponse(res: GetTransactionListResponse) {
        if let errMsg = res.errMsg {
            print("giap check res error", errMsg)
            return
        }
        
        if res.status {
//            self.view?.showAlert(title: "Sign Up Success", isError: false, message: "")
            self.recentTransactionList.accept(res.transactions)
        }
    }
}

//MARK: - API
extension HomeViewModel {
    private func getRecentTransactions(t_user_id: String) {
//        self.view?.showLoader()
        let request = GetTransactionListRequest(t_user_id: t_user_id)
        
        apiService.getRecentTransactions(getRecentTransactionRequest: request) { response in
            switch response {
            case .success(let value):
                self.handleResponse(res: value)
//                self.view?.dismissLoader()
            case .failure(let error):
                print("giap check fail", error)
//                self.view?.dismissLoader()
            }
        }
    }
}
