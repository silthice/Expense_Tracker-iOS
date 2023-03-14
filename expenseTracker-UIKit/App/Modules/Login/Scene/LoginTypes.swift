//
//  LoginTypes.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa


protocol LoginViewType: BaseViewType {
    func login()
    func routeToSignup()
    func toggleShowHidePassword()
    func updateHintContainer(textFieldType: ExpenseTracker.Enum.EnumTextFieldPurposeType, message: String)
    
}

typealias LoginViewControllerType = UIViewController & LoginViewType

