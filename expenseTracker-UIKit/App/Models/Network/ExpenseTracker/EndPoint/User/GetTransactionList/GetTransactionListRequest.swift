//
//  GetTransactionListRequest.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 07/04/2023.
//

import Foundation

struct GetTransactionListRequest : Codable {
    var t_user_id : String = ""
    
    enum CodingKeys: String, CodingKey {
        case t_user_id = "t_user_id"
    }
    
    init(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(t_user_id, forKey: .t_user_id)
    }
    
    
    init(t_user_id: String) {
        self.t_user_id = t_user_id
        
    }
}
