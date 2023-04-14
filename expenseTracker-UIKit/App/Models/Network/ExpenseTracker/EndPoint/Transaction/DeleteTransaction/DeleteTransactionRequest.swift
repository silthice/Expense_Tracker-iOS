//
//  DeleteTransactionRequest.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import Foundation

class DeleteTransactionRequest: GetTransactionListRequest {
    
    var t_id : String = ""
    
    enum CodingKeys: String, CodingKey {
        case t_id = "t_id"
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.t_id = try container.decode(String.self, forKey: .t_id)
    }
    
    init(t_user_id: String, t_id: String) {
        super.init(t_user_id: t_user_id)
        self.t_id = t_id
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(t_id, forKey: .t_id)
    }
}
