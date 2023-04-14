//
//  DeleteTransactionResponse.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import Foundation

class DeleteTransactionResponse: BaseResponse {
    var message: String?
    
    enum CodingKeys: String,CodingKey{
        case message = "message"
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
    }
}
