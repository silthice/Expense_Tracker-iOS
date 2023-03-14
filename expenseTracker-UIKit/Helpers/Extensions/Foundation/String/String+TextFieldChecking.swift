//
//  String+TextFieldChecking.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
extension String {
    public var isValidMobile: Bool {
        let regixStr = "^[0-9]{7,13}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidOtp: Bool {
        let regixStr = "^[0-9]{6}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)

    }
    
    public var isValidUsername: Bool {
        let regixStr : String =  "^[A-Za-z0-9]{4,18}$"
        let predicate :NSPredicate = NSPredicate(format:"SELF MATCHES %@",regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidPassword: Bool {
        if (self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil) {
            return false
        }
        
        let regixStr = NSPredicate(format: "SELF MATCHES %@", "^(?!.* )(?=.*\\d)(?=.*[A-Za-z]).{8,20}$")//’‘“”
        return regixStr.evaluate(with: self)
    }
    
    public var isValidReferral: Bool {
        let regixStr : String =  "^[A-Za-z0-9]{8}$"
        let predicate :NSPredicate = NSPredicate(format:"SELF MATCHES %@",regixStr)
        return predicate.evaluate(with: self)
    }

    public var isValidCardFormat: Bool {
        let regixStr = "^[0-9]{16,19}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidCardPattern: Bool {
        let firstChar = self.firstCharacterAsString
        if firstChar == "0" || firstChar == "2" || firstChar == "7" {
            return false
        } else {
            return true
        }
    }

    public var isValidERC20: Bool {
        let regixStr = "^0x[a-zA-Z0-9]{40}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidTRC20: Bool {
        let regixStr = "^T[a-zA-Z0-9]{33}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidFullName: Bool {
        let regixStr = "^[\\u4e00-\\u9fa5\\u00B7]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }

    public var isValidNickname: Bool {
        let regixStr : String =  "^[\\u4e00-\\u9fa5A-Za-z0-9]{4,16}$"
        let predicate :NSPredicate = NSPredicate(format:"SELF MATCHES %@",regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidNonDecimalAmount: Bool {
        let regixStr = "^[0-9]{1,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidDecimalAmount: Bool {
        let regixStr = "^(\\d+(\\.\\d{0,2})?|\\.?\\d{1,2})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }
    
    public var isValidBankBranch: Bool {
        let regixStr = "^[\\u4e00-\\u9fa5]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regixStr)
        return predicate.evaluate(with: self)
    }
}
