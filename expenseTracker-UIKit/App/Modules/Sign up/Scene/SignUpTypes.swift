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
    func showLoader()
    func dismissLoader()
    func showAlert(title: String?, isError: Bool, message: String)
}

typealias SignUpViewControllerType = UIViewController & SignUpViewType

