//
//  UIView+RxViewControllerCycle.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    var viewWillAppearForFirstTime: Driver<Void> {
        let base = self.base
        return viewWillAppear
            .flatMapLatest { [weak base] _ -> Driver<Void> in
                guard let base = base else {
                    return Driver.empty()
                }
                let count = base.viewWillAppearCount
                if count == 0 {
                    return Driver.never()
                } else if count == 1 {
                    return Driver.just(())
                } else {
                    return Driver.never()
                }
            }
            .asVoid()
    }
    
    var viewWillAppear: Driver<Void> {
        return base.rx.methodInvoked(#selector(UIViewController.viewWillAppear(_:)))
            .asDriverOnErrorJustComplete()
            .asVoid()
    }
    
    var viewDidAppearForFirstTime: Driver<Void> {
        let base = self.base
        return viewDidAppear
            .flatMapLatest { [weak base] _ -> Driver<Void> in
                guard let base = base else {
                    return Driver.empty()
                }
                let count = base.viewDidAppearCount
                if count == 0 {
                    return Driver.never()
                } else if count == 1 {
                    return Driver.just(())
                } else {
                    return Driver.never()
                }
            }
            .asVoid()
    }
    
    var viewDidAppear: Driver<Void> {
        return base.rx.methodInvoked(#selector(UIViewController.viewDidAppear(_:)))
            .asDriverOnErrorJustComplete()
            .asVoid()
    }
    
    var viewWillDisappear: Driver<Void> {
        return base.rx.methodInvoked(#selector(UIViewController.viewWillDisappear(_:)))
            .asDriverOnErrorJustComplete()
            .asVoid()
    }
    
    var viewDidDisappear: Driver<Void> {
        return base.rx.methodInvoked(#selector(UIViewController.viewDidDisappear(_:)))
            .asDriverOnErrorJustComplete()
            .asVoid()
    }
    
    var viewDidLoad: Driver<Void> {
        return base.rx.methodInvoked(#selector(UIViewController.viewDidLoad))
            .asDriverOnErrorJustComplete()
            .asVoid()
    }
}

