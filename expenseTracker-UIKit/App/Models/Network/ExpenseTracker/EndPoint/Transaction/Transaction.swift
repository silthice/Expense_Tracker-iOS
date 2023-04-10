//
//  Transaction.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 07/04/2023.
//

import Foundation

struct Transaction: Codable {
    var _id: String?
    var t_user_id: String?
    var t_cat_id: Int
    var t_cat_name: String?
    var t_amt: Double
    var t_r_id: String?
    var t_r_name: String?
    var t_rate_during_transaction: Double
    var t_is_income: Bool
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String,CodingKey {
        case _id = "_id"
        case t_user_id = "t_user_id"
        case t_cat_id = "t_cat_id"
        case t_cat_name = "t_cat_name"
        case t_amt = "t_amt"
        case t_r_id = "t_r_id"
        case t_r_name = "t_r_name"
        case t_rate_during_transaction = "t_rate_during_transaction"
        case t_is_income = "t_is_income"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decodeIfPresent(String.self, forKey: ._id) ?? ""
        t_user_id = try container.decodeIfPresent(String.self, forKey: .t_user_id) ?? ""
        t_cat_id = try container.decodeIfPresent(Int.self, forKey: .t_cat_id) ?? 0
        t_cat_name = try container.decodeIfPresent(String.self, forKey: .t_cat_name) ?? ""
        t_amt = try container.decodeIfPresent(Double.self, forKey: .t_amt) ?? 0
        t_r_id = try container.decodeIfPresent(String.self, forKey: .t_r_id) ?? ""
        t_r_name = try container.decodeIfPresent(String.self, forKey: .t_r_name) ?? ""
        t_rate_during_transaction = try container.decodeIfPresent(Double.self, forKey: .t_rate_during_transaction) ?? 0
        t_is_income = try container.decodeIfPresent(Bool.self, forKey: .t_is_income) ?? false
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        
    }
}
