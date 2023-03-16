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
    var signUpButtonDidTap: Driver<Void> = .never()
    var loginButtonDidTap: Driver<Void> = .never()
    var showHidePasswordButtonDidTap: Driver<Void> = .never()
    var showHideConfirmPasswordButtonDidTap: Driver<Void> = .never()
    
    //MARK: - Outputs
    public weak var view: SignUpViewType? = nil
    
    //MARK: - Dependencies
//    @Injected fileprivate var userService : UserServiceType
    let apiService = APIService()
    
    //MARK: - Constants
    //MARK: - Vars
    var showPassword: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var showConfirmPassword: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var usernameRelay: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var emailRelay: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var passwordRelay: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var confirmPasswordRelay: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    
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
        
        let toggleShowHide = self.showHidePasswordButtonDidTap
            .do(onNext: { self.view?.toggleShowHidePassword()})
        
        let toggleConfirmShowHide = self.showHideConfirmPasswordButtonDidTap
            .do(onNext: { self.view?.toggleConfirmShowHidePassword()})
                
//        let signup = self.signUpButtonDidTap
//            .filter { _ in
//                let usernameValid = self.isValidUsername(username: self.usernameRelay.value ?? "")
//                let emailValid = self.isValidEmail(email: self.emailRelay.value ?? "")
//                let passwordValid = self.isValidPassword(textFieldType: .password, password: self.passwordRelay.value ?? "")
//                let password2Valid = self.isValidPassword(textFieldType: .password2, password: self.confirmPasswordRelay.value ?? "")
//                let passwordMatch = self.isMatchPasswords(password1: self.passwordRelay.value ?? "", password2: self.confirmPasswordRelay.value ?? "")
//                return (usernameValid && emailValid && passwordValid && password2Valid && passwordMatch)
//            }
//            .flatMapLatest{ _ in
//                self.registerMember(username: self.usernameRelay.value ?? "", email: self.emailRelay.value ?? "", password: self.passwordRelay.value ?? "")
//            }
//            .do(onNext: { response in
//                print("giap check", response)
//            })
                
        let signup = self.signUpButtonDidTap
            .filter { _ in
                let usernameValid = self.isValidUsername(username: self.usernameRelay.value ?? "")
                let emailValid = self.isValidEmail(email: self.emailRelay.value ?? "")
                let passwordValid = self.isValidPassword(textFieldType: .password, password: self.passwordRelay.value ?? "")
                let password2Valid = self.isValidPassword(textFieldType: .password2, password: self.confirmPasswordRelay.value ?? "")
                let passwordMatch = self.isMatchPasswords(password1: self.passwordRelay.value ?? "", password2: self.confirmPasswordRelay.value ?? "")
                return (usernameValid && emailValid && passwordValid && password2Valid && passwordMatch)
            }
            .do(onNext: {
                
//                self.register(username: "giap3", email: "giap@mail.com", password: "giap1234")
                
                guard
                    let username = self.usernameRelay.value,
                    let email = self.emailRelay.value,
                    let password = self.passwordRelay.value
                else {
                    return
                }

                self.register(username: username, email: email, password: password)
            })
                
        let routeToLogin = self.loginButtonDidTap
            .do(onNext: { self.view?.routeToLogin() })
                
        disposeBag.insert(
            toggleShowHide.drive(),
            toggleConfirmShowHide.drive(),
            routeToLogin.drive(),
            signup.drive()
        )
    }
}

extension SignUpViewModel {
    func isValidUsername(username: String) -> Bool {
        if username.isValidUsername {
            self.view?.updateHintContainer(textFieldType: .username, message: " ")
            return true
        }
        else {
            self.view?.updateHintContainer(textFieldType: .username, message: "Username should be 4-18 alphanumeric characters​")
            return false
        }
    }
    
    func isValidPassword(textFieldType: ExpenseTracker.Enum.EnumTextFieldPurposeType, password: String) -> Bool {
        if password.isValidPassword {
            self.view?.updateHintContainer(textFieldType: textFieldType, message: " ")
            return true
        }
        else {
            self.view?.updateHintContainer(textFieldType: textFieldType, message: "Password should be 8-20 alphanumeric characters and at least a number​")
            return false
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        if email.isValidEmail {
            self.view?.updateHintContainer(textFieldType: .email, message: " ")
            return true
        }
        else {
            self.view?.updateHintContainer(textFieldType: .email, message: "Invalid Email Format")
            return false
        }
    }
    
    func isMatchPasswords(password1: String, password2: String) -> Bool {
        if password2.isEmpty {
            self.view?.updateHintContainer(textFieldType: .password2, message: "Please re-enter your confirmation password")
            return false
        }
        
        if password1 != password2 {
            self.view?.updateHintContainer(textFieldType: .password2, message: "Passwords mismatch")
            return false
        } else {
            self.view?.updateHintContainer(textFieldType: .password2, message: " ")
            return true
        }
        
    }
    
}

extension SignUpViewModel {
    func handleResponse(res: SignUpResponse) {
        if let errMsg = res.errMsg {
            self.view?.showAlert(title: "Sign Up Failed", isError: true, message: errMsg)
            return
        }
        
        if res.status {
            self.view?.showAlert(title: "Sign Up Success", isError: false, message: "")
        }
    }
}

//MARK: - API
extension SignUpViewModel {
    
    private func register(username: String, email: String, password: String) {
        self.view?.showLoader()
        let request = SignUpRequest(username: username, email: email, password: password)
        
        apiService.signUp(signUpRequest: request) { response in
            switch response {
            case .success(let value):
                self.handleResponse(res: value)
                self.view?.dismissLoader()
            case .failure(let error):
                self.view?.dismissLoader()
            }
        }
    }
    
}
