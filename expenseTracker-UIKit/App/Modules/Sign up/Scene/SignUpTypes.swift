//
//  SignUpTypes.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/03/2023.
//
import UIKit
import RxSwift
import RxCocoa


protocol SignUpViewType: BaseViewType {
    func toggleShowHidePassword()
    func toggleConfirmShowHidePassword()
    func updateHintContainer(textFieldType: ExpenseTracker.Enum.EnumTextFieldPurposeType, message: String)
    func routeToLogin()
    func signUp()
    
}

typealias SignUpViewControllerType = UIViewController & SignUpViewType

