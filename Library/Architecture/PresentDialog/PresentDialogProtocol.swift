//
//  PresentDialogProtocol.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift
import RxCocoa

protocol PresentDialogProtocol {
    func presentDialog(title: String?, message: String?, actions: [String]) -> Driver<Int>
    func presentDialog(title: String?, message: String?, actions: [DialogAction]) -> Driver<DialogAction>
    func presentDialog(title: String?, message: String?, action: DialogAction) -> Driver<DialogAction>
}

