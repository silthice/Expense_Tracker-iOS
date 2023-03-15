//
//  User.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 15/03/2023.
//

import Foundation

struct User: Codable {
    var _id : String?
    var username : String?
    var displayName : String?
    

    enum CodingKeys: String,CodingKey{
        case _id = "_id"
        case username = "username"
        case displayName = "displayName"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(String.self, forKey: ._id)
        self.username = try container.decode(String.self, forKey: .username)
        self.displayName = try container.decode(String.self, forKey: .displayName)
    }
}
