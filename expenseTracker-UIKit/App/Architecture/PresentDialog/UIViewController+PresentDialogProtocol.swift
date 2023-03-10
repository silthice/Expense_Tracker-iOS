//
//  UIViewController+PresentDialogProtocol.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SwifterSwift

extension UIViewController: PresentDialogProtocol {
    func presentDialog(title: String?, message: String?, actions: [String]) -> Driver<Int> {
        let impl = PresentDialogProtocolImpl(base: self)
        return impl.presentDialog(title: title, message: message, actions: actions)
    }
    
    func presentDialog(title: String?, message: String?, actions: [DialogAction]) -> Driver<DialogAction> {
        let impl = PresentDialogProtocolImpl(base: self)
        return impl.presentDialog(title: title, message: message, actions: actions)
    }
    
    func presentDialog(title: String?, message: String?, action: DialogAction) -> Driver<DialogAction> {
        let impl = PresentDialogProtocolImpl(base: self)
        return impl.presentDialog(title: title, message: message, action: action)
    }
}
