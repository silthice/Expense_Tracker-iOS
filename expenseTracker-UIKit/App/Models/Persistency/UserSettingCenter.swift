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
    
    //UserInfo
//    class var userInfo: Data? {
//        get {
//            if let userInfo = retrieve("userInfo") as! Data?{
//                return userInfo
//            }
//            return nil
//        }
//        set (userInfo) {
//            persist(userInfo as AnyObject?, forKey: "userInfo")
//        }
//    }
    
    //Decided to use User Id only
    //User Id
    class var userId: String {
        get {
            if let userId = retrieve("userId") as! String?{
                return userId
            }
            return ""
        }
        set (userId) {
            persist(token as AnyObject?, forKey: "userId")
        }
    }
    
    //Bearer Token
    class var token: String {
        get {
            if let token = retrieve("token") as! String?{
                return token
            }
            return ""
        }
        set (token) {
            persist(token as AnyObject?, forKey: "token")
        }
    }
    
    //Prefer Currency
    
}
