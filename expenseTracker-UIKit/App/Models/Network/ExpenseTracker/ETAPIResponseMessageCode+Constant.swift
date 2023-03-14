//
//  ETAPIResponseMessageCode+Constant.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import Foundation

struct ResponseError {
    var name: String
    var code: String
    var message: String
}

struct ResponseMessageCode {
    static let responseErrors: [ResponseError] = [
        //MARK: General
//        ResponseError(name: "Fail", code: "GNR00002", message: "失败"),
        
        //MARK: Signup
//        ResponseError(name: "Loginname does not meet specifications", code: "RGT00001", message: "账户名已存在，请尝试其他​")
        
        //MARK: Login
    ]
}
