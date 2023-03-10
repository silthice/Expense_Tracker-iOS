//
//  BaseViewType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

protocol BaseViewType: ErrorHandlingViewType, PresentDialogProtocol, PresentWithIntentProtocol, DismissWithResultProtocol, DisposeOnWillRemoveFromParentType {
}
