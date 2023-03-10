//
//  ViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewType {
    associatedtype VM: ViewModelType
    var viewModel: VM! { set get }
}
