//
//  DisposeOnWillRemoveFromParentType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxSwift
import RxCocoa

protocol DisposeOnWillRemoveFromParentType: class {
    var disposeOnWillRemoveFromParent:Bool { set get }
}
