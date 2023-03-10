//
//  DisposeBagHolderType+Extension.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift

fileprivate struct AssociatedKey {
    static var disposeBag = "disposeBag"
}
extension DisposeBagHolderType {
    
    var disposeBag:DisposeBag {
        get {
            var ret:DisposeBag? = getAssociatedObject(self, associativeKey: &AssociatedKey.disposeBag)
            if ret == nil {
                ret = DisposeBag()
                setAssociatedObject(self, value: ret, associativeKey: &AssociatedKey.disposeBag)
            }
            return ret!
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.disposeBag)
        }
    }
}

extension Disposable where Self: DisposeBagHolderType  {
    func dispose() {
        disposeBag = DisposeBag()
    }
}
