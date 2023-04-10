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
    func routeToSignup()
    func routeToDashboard()
    func toggleShowHidePassword()
    func updateHintContainer(textFieldType: ExpenseTracker.Enum.EnumTextFieldPurposeType, message: String)
    func showLoader()
    func dismissLoader()
    func showAlert(title: String?, isError: Bool, message: String)
}

typealias LoginViewControllerType = UIViewController & LoginViewType

