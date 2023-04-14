//
//  ETAlertViewModel.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import Foundation
import RxSwift
import RxCocoa
import SwifterSwift

final class ETAlertViewModel: BaseViewModel {
    
    //MARK: - Inputs
    var button1DidTap: Driver<Void> = .never()
    var button2DidTap: Driver<Void> = .never()
    var button1Action: ((AlertButtonType) -> Void)?
    var button2Action: ((AlertButtonType) -> Void)?
    
    //MARK: - Outputs
    public weak var view: ETAlertViewType? = nil
    
    //MARK: - Dependencies
    let apiService = APIService()
    @Injected private var ETKeychain: ETKeyChainType
    
    //MARK: - Constants
    //MARK: - Vars
    
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
        
        let button1DidTap = button1DidTap
            .do(onNext: { _ in
                self.view?.dismiss()
                self.button1Action?(.primary)
            })
        let button2DidTap = button2DidTap
            .do(onNext: { _ in
                self.button2Action?(.secondary)
                self.view?.dismiss()
            })
        
        disposeBag.insert(
            button1DidTap.drive(),
            button2DidTap.drive()
        )
    }
}

extension ETAlertViewModel {
}

//MARK: - API
extension ETAlertViewModel {
    
}
