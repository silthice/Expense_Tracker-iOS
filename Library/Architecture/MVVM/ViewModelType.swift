//
//  ViewModelType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType: DisposeBagHolderType, Disposable {
    func transform()
    func subscribeAnalytics()
}
