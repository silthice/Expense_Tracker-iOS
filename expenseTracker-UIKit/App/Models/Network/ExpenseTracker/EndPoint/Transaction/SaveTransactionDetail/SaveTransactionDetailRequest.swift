//
//  SaveTransactionDetailRequest.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 12/04/2023.
//

import Foundation

class SaveTransactionDetailRequest: GetTransactionListRequest {
    
    var t_id : String = ""
    var t_cat_id : Int = 0
    var t_amt : Double = 0
    var t_r_id : String = ""
    var t_is_income : Bool = false
    
    enum CodingKeys: String, CodingKey {
        case t_id = "t_id"
        case t_cat_id = "t_cat_id"
        case t_amt = "t_amt"
        case t_r_id = "t_r_id"
        case t_is_income = "t_is_income"
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.t_id = try container.decode(String.self, forKey: .t_id)
        self.t_cat_id = try container.decode(Int.self, forKey: .t_cat_id)
        self.t_amt = try container.decode(Double.self, forKey: .t_amt)
        self.t_r_id = try container.decode(String.self, forKey: .t_r_id)
        self.t_is_income = try container.decode(Bool.self, forKey: .t_is_income)
    }
    
    init(t_user_id: String, t_id: String, t_cat_id: Int, t_amt: Double, t_r_id: String, t_is_income: Bool) {
        super.init(t_user_id: t_user_id)
        self.t_id = t_id
        self.t_cat_id = t_cat_id
        self.t_amt = t_amt
        self.t_r_id = t_r_id
        self.t_is_income = t_is_income
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(t_id, forKey: .t_id)
        try container.encode(t_cat_id, forKey: .t_cat_id)
        try container.encode(t_amt, forKey: .t_amt)
        try container.encode(t_r_id, forKey: .t_r_id)
        try container.encode(t_is_income, forKey: .t_is_income)
    }
}
