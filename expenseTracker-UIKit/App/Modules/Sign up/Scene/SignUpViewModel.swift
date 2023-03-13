//
//  SignUpViewModel.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/03/2023.
//

import Foundation
import RxSwift
import RxCocoa
import SwifterSwift

final class SignUpViewModel: BaseViewModel {
    
    //MARK: - Inputs
    
    //MARK: - Outputs
    public weak var view: SignUpViewType? = nil
    
    //MARK: - Dependencies
    
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
        
                
        disposeBag.insert(
        )
    }
}

extension SignUpViewModel {
}

