//
//  ETAlertViewTypes.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import UIKit
import RxSwift
import RxCocoa


protocol ETAlertViewType: BaseViewType {
    func dismiss()
}

typealias ETAlertViewControllerType = UIViewController & ETAlertViewType

