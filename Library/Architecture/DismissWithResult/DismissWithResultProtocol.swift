//
//  DismissWithResultProtocol.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift
import RxCocoa

protocol DismissWithResultProtocol: class, DismissWithResultProtocolHelper {
    var dismissIdentifier: Any? { set get }
    var onDismissResult: PublishRelay<DismissResult> { get }
}

@objc protocol DismissWithResultProtocolHelper {
    func exitWithResult(animated: Bool, result: DismissResult, completion: (()->())?)
    func closeWithResult(animated: Bool, result: DismissResult, completion: (()->())?)
    func popWithResult(animated: Bool, result: DismissResult, completion: (()->())?)
}
