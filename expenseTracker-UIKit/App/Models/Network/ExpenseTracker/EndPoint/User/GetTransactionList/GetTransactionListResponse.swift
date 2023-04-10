//
//  GetTransactionListResponse.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 07/04/2023.
//

import Foundation
class GetTransactionListResponse: BaseResponse {
    var transactions: [Transaction] = []
    
    enum CodingKeys: String,CodingKey{
        case transactions = "transactions"
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transactions = try container.decode(Array.self, forKey: .transactions)
    }
}
