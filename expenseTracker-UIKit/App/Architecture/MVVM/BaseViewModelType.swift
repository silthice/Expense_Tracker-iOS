//
//  BaseViewModelType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol BaseViewModelType: ViewModelType {
    //MARK: Input
    var startLoad: Driver<Void> { set get }
    var startResume: Driver<Void> { set get }
    var startReload: Driver<Void> { set get }
    var startLoadMore: Driver<Void> { set get }
    var startExit: Driver<Void> { set get }
    //MARK: Output
    var showLoading: Driver<Bool> { set get }
    var contentReady: Driver<Bool> { set get }
    var exitWithResult: Driver<DismissResult> { set get }
    //MARK: State
    var activityIndicator: ActivityIndicator { get }
    var errorTracker: ErrorTracker { get }
    var stopEventTracker: StopEventTracker { get }
}
