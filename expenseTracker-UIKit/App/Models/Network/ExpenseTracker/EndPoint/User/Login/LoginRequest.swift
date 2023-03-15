//
//  LoginRequest.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 15/03/2023.
//

import Foundation

struct LoginRequest : Codable {
    var username : String = ""
    var password : String = ""
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case password = "password"
    }
    
    init(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }
    
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        
    }
}
