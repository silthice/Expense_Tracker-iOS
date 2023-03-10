//
//  BaseViewModel.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: BaseViewModelType, ViewModelType, ReactiveCompatible {
    //MARK: Input
    public var startLoad: Driver<Void> = .never()
    public var startResume: Driver<Void> = .never()
    public var startReload: Driver<Void> = .never()
    public var startLoadMore: Driver<Void> = .never()
    public var startExit: Driver<Void> = .never()
    //MARK: Output
    public var showLoading: Driver<Bool> = .never()
    public var contentReady: Driver<Bool> = .never()
    public var exitWithResult: Driver<DismissResult> = .never()
    //MARK: Dependency
//    @Injected public var buildConfig: BuildConfigType
    @Injected public var dateProvider: DateProviderType
    @Injected public var Defaults: UserDefaults
    //MARK: State
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    let stopEventTracker = StopEventTracker()
    
    //MARK: transform
    func transform() {
        showLoading = activityIndicator.asDriver()
    }
    
    func subscribe() {
        
    }
    
    func dispose() {
        Log.debug("\(self)", userInfo: LogTag.clearup.dictionary)
        //Input
        startLoad = .never()
        startResume = .never()
        startReload = .never()
        startExit = .never()
        //Output
        showLoading = .never()
        contentReady = .never()
        exitWithResult = .never()
        //DisposeBag
        disposeBag = DisposeBag()
    }
    
    //MARK: Subscribe Analytics
    func subscribeAnalytics() {
        /* sample subscribing analytics
         let buttonTap = buttonDidTap.drive(onNext: { [unowned self] _ in
            self.analyticManager.track(event: .button(key: "testButton", parameters: ["test_button": "123"]))
        })
        disposeBag.insert(buttonTap)
         */
    }
    
    deinit {
        Log.debug("\(self)", userInfo: LogTag.clearup.dictionary)
    }
    //MARK: Helper
}
