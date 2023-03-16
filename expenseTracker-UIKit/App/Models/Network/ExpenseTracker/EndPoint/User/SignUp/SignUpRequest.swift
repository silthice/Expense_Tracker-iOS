//
//  SignUpRequest.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 16/03/2023.
//

import Foundation

struct SignUpRequest : Codable {
    var username : String = ""
    var email : String = ""
    var password : String = ""
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case email = "email"
        case password = "password"
    }
    
    init(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
    }
    
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
        
    }
}
