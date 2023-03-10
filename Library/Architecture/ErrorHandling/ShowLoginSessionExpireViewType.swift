//
//  ShowLoginSessionExpireViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import RxCocoa
import RxSwift
import UIKit

protocol ShowLoginSessionExpireViewType {
    func showLoginSessionExpire(error:NSError) -> Driver<Void>
}
