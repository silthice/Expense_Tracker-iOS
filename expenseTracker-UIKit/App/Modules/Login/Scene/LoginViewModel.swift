//
//  LoginViewModel.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//


import Foundation
import RxSwift
import RxCocoa
import SwifterSwift

final class LoginViewModel: BaseViewModel {
    
    //MARK: - Inputs
    
    //MARK: - Outputs
    
    //MARK: - Dependencies
    
    //MARK: - States
    public weak var view: LoginViewType? = nil
    
    //MARK: - Initializer
    override init() {
        super.init()
    }
    
    override func dispose() {
        super.dispose()
    }
    
    //MARK: - Transform
    override func transform() {
        super.transform()
        
                
        disposeBag.insert(
        )
    }
}

extension LoginViewModel {
}

