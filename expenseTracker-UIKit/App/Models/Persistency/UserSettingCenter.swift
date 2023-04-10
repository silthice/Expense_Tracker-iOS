//
//  UserSettingCenter.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 15/03/2023.
//

import Foundation

class UserSettingCenter {
    
    let shared = UserSettingCenter()
    
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
    //Decided to use User Id only
    //User Id
    //Bearer Token
    
    //Prefer Currency
    
}
