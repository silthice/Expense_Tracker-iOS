//
//  ETKeyChainType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 07/04/2023.
//

import Foundation
import SwiftDate
import KeychainAccess

public protocol ETKeyChainType {
    
    func getBearerToken() -> String?
    func setBearerToken(_ value:String?) throws
    
    func getLoginName() -> String?
    func setLoginName(_ value:String?) throws
    
    func getUserId() -> String?
    func setUserId(_ value:String?) throws
    
    func getCurrencyCodeString() -> String?
    func getCurrencyCode() -> String?
    func setCurrencyCode(_ value:String?) throws
    
    func setAllKeysToEmpty() throws
}
