//
//  UIViewController+PresentErrorProtocol.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SwifterSwift

extension UIViewController: PresentErrorProtocol {
    func present(error: Error, completion: @escaping ()->()) {
        let impl = PresentErrorProtocolImpl(base: self)
        return impl.present(error:error, completion: completion)
    }
}
