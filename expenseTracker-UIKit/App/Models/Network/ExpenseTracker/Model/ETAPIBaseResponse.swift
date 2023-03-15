//
//  ETAPIBaseResponse.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import Foundation
import CodableExtensions
import SwiftDate

class BaseResponse : Codable {
    var status:Bool = false
    var errMsg:String? = nil

    fileprivate enum CodingKeys: String, CodingKey {
        case status = "status"
        case errMsg = "errMsg"
    }
    
    init() { }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decode(.status)
        errMsg = try? values.decode(.errMsg)
    }
}
