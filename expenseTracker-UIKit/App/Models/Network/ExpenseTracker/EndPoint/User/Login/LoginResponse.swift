//
//  LoginResponse.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 15/03/2023.
//

import Foundation

class LoginResponse: BaseResponse {
    var token: String?
    var user: User?
    
    enum CodingKeys: String,CodingKey{
        case token = "token"
        case user = "user"
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try container.decode(String.self, forKey: .token)
        self.user = try container.decode(User.self, forKey: .user)
    }
}
