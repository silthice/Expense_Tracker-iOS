//
//  DisposableEvent.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import RxSwift
import RxCocoa

@propertyWrapper
class DisposableEvent<T> : Disposable {
    func dispose() {
        event = .never()
    }
    
    var event: Driver<T> = .never()
    public var wrappedValue: Driver<T> {
        get {
            return event
        }
        set {
            event = newValue
        }
    }
    
    init(wrappedValue: Driver<T>) {
        self.event = wrappedValue
    }
}

func disposeDisposableEventProperties(object: Any) {
    let mirror = Mirror(reflecting: object)
    for child in mirror.children {
        if let child = child.value as? Disposable {
            child.dispose()
        }
    }
}
