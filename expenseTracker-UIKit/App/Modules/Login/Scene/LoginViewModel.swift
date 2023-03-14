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
    var loginButtonDidTap: Driver<Void> = .never()
    var signUpButtonDidTap: Driver<Void> = .never()
    var showHidePasswordButtonDidTap: Driver<Void> = .never()
    
    //MARK: - Outputs
    public weak var view: LoginViewType? = nil
    
    //MARK: - Dependencies
    
    //MARK: - Constants
    //MARK: - Vars
    var showPassword: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var usernameRelay = BehaviorRelay<String?>(value: nil)
    var passwordRelay: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
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
        
        let login = self.loginButtonDidTap
            .filter { _ in
                let usernameValid = self.isValidUsername(username: self.usernameRelay.value ?? "")
                let passwordValid = self.isValidPassword(password: self.passwordRelay.value ?? "")
                return (usernameValid && passwordValid)
            }
            .do(onNext: { _ in
                self.view?.login()
            })
                
        let routeToSignup = self.signUpButtonDidTap
            .do(onNext: { self.view?.routeToSignup() })
                
        let toggleShowHide = self.showHidePasswordButtonDidTap
            .do(onNext: { self.view?.toggleShowHidePassword()})
        
                
        disposeBag.insert(
            login.drive(),
            routeToSignup.drive(),
            toggleShowHide.drive()
        )
    }
}

extension LoginViewModel {
    func isValidUsername(username: String) -> Bool {
        if username.isValidUsername {
            self.view?.updateHintContainer(textFieldType: .username, message: " ")
            return true
        }
        else {
            self.view?.updateHintContainer(textFieldType: .username, message: "Username should be 6-18 alphanumeric characters​")
            return false
        }
    }
    
    func isValidPassword(password: String) -> Bool {
        if password.isValidPassword {
            self.view?.updateHintContainer(textFieldType: .password, message: " ")
            return true
        }
        else {
            self.view?.updateHintContainer(textFieldType: .password, message: "Password should be 8-20 alphanumeric characters and at least a number​")
            return false
        }
    }
}

