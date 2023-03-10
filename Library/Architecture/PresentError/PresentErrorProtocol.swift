//
//  PresentErrorProtocol.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift
import RxCocoa

@objc protocol PresentErrorProtocol: class {
    func present(error: Error, completion: @escaping ()->())
}
extension PresentErrorProtocol {
    func present(error: Error) -> Driver<Void> {
        return Observable<Void>.create { observer -> Disposable in
            self.present(error: error, completion: {
                observer.onNext(())
                observer.onCompleted()
            })
            return Disposables.create()
        }
        .asDriverOnErrorJustComplete()
    }
}
