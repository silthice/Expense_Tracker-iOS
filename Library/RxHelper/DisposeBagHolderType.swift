//
//  DisposeBagHolderType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift

protocol DisposeBagHolderType: class {
    var disposeBag:DisposeBag { set get }
}
