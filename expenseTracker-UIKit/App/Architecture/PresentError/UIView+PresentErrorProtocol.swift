//
//  UIView+PresentErrorProtocol.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

extension UIView: PresentErrorProtocol {
    func present(error: Error, completion: @escaping ()->()) {
        self.parentViewController?.present(error:error, completion: completion)
    }
}
