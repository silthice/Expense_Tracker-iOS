//
//  SaveTransactionDetailResponse.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 12/04/2023.
//

import Foundation
class SaveTransactionDetailResponse: BaseResponse {
    var transactionDetail: Transaction?
    
    enum CodingKeys: String,CodingKey{
        case transactionDetail = "transactionDetail"
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transactionDetail = try container.decode(Transaction.self, forKey: .transactionDetail)
    }
}
