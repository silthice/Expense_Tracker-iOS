//
//  ErrorHandlingViewModelType+Extension.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift
import RxCocoa
import SwifterSwift


protocol ExitToDashboardViewType {
    func exitToDashboard()
}

extension ErrorHandlingViewModelType where Self: BaseViewModel {
    func transformErrorHandling(input:ErrorHandlingInput) -> ErrorHandlingOutput {
        let error = input.error
        error
            .flatMapLatest ({ (error: NSError) -> Driver<Void> in
                if let response = error.apiResponseObject as? BaseResponse {
//                    if N8API.Enum.ErrCodeUnauthorize(rawValue: response.code ?? "") != nil {
//                        // The result code is one of the force logout
//                        return self.processUnauthorizedError(view: input.view, error: error)
//                    }
//                    else if N8API.Enum.ErrCodeException(rawValue: response.code ?? "")  != nil {
//                        // Each code has individual screen handling code, dont do anything here
//                        return .empty()
//                    }
                    return self.processError(view: input.view, error: error)
                } else {
                    return self.processError(view: input.view, error: error)
                }
            })
            .drive()
            .disposed(by: disposeBag)
        return .none()
    }
    
    func processError(view:ErrorHandlingViewType?, error: NSError) -> Driver<Void> {
        return processOtherError(view: view, error: error)
    }
    
    func processUnauthorizedError(view: ErrorHandlingViewType?, error: NSError) -> Driver<Void> {
        guard let view = view else { return .just(()) }
        return view.showLoginSessionExpire(error: error)
            .do(onNext: { (_) in
                
            })
    }
    
    func processOtherError(view:ErrorHandlingViewType?, error: NSError) -> Driver<Void> {
        guard let view = view else { return .just(()) }
        return view.present(error: error).asVoid()
    }
}


