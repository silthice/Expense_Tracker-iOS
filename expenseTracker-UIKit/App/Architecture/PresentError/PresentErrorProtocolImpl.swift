//
//  PresentErrorProtocolImpl.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SwifterSwift

class PresentErrorProtocolImpl: PresentErrorProtocol {
    weak var base: UIViewController? = nil
    init(base: UIViewController) {
        self.base = base
    }
    func present(error: Error, completion: @escaping ()->()) {
        /// Check if it is generic error (data mapping error), do not show toast
        guard error.error.code != 9999 else { return }
        var message = error.localizedDescription
        if message.lowercased().contains("connection") {
            message = "似乎与互联网断开连接"
        }
        else if message.lowercased().contains("session") {
            message = "网络请求超时"
        }

        DispatchQueue.main.async {
            SwifterSwift.mostTopViewController?.view.showToastOnTopStyle(message)
        }
    }
}
