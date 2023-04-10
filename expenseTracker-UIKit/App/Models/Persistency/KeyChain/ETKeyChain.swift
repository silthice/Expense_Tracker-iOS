//
//  ETKeyChain.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 07/04/2023.
//

import Foundation
import SwiftDate
import KeychainAccess

public class ETKeyChain : ETKeyChainType {
    
    

    //MARK: KeyChain
    public let appKeyChain : Keychain
    @Injected var buildConfig: BuildConfigType
    
    public init() {
        appKeyChain = Keychain(service: "com.ocgroup.keychain")
    }
    
    fileprivate class func retrieve (_ key: String) -> AnyObject? {
        
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
    
    fileprivate class func persist (_ content: AnyObject?, forKey key: String) {
        
        if let _ = content {
            UserDefaults.standard.set(content, forKey: key)
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
    public func getBearerToken() -> String? {
        if let ETBearerToken = ETKeyChain.retrieve("ETBearerToken") as! String?{
            return ETBearerToken
        }
        return ""
    }
    
    public func setBearerToken(_ value: String?) throws {
        ETKeyChain.persist(value as AnyObject?, forKey: "ETBearerToken")
    }
    
    public func getUserId() -> String? {
        if let ETUserId = ETKeyChain.retrieve("ETUserId") as! String?{
            return ETUserId
        }
        return ""
    }
    
    public func setUserId(_ value: String?) throws {
        ETKeyChain.persist(value as AnyObject?, forKey: "ETUserId")
    }
    
    public func getLoginName() -> String? {
        if let ETUsername = ETKeyChain.retrieve("ETUsername") as! String?{
            return ETUsername
        }
        return ""
    }
    
    public func setLoginName(_ value: String?) throws {
        ETKeyChain.persist(value as AnyObject?, forKey: "ETUsername")
    }
    
    /// CurrencyCode
    public func getCurrencyCode() -> String? {
        
        if let ETCurrencyCode = ETKeyChain.retrieve("ETCurrencyCode") as! String?{
            return ETCurrencyCode.uppercased() == "MYR" ? "RM" : "$"
        }
//        return ""
        return "SGD"
    }
    
    public func setCurrencyCode(_ value: String?) throws {
        ETKeyChain.persist(value as AnyObject?, forKey: "ETCurrencyCode")
    }
        
    public func getCurrencyCodeString() -> String? {
        
        if let ETCurrencyCode = ETKeyChain.retrieve("ETCurrencyCode") as! String?{
            return ETCurrencyCode.uppercased()
        }
        return ""
    }
    
    
    public func setAllKeysToEmpty() throws {
    }

}
