//
//  ETAPIBaseRequest.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import Foundation
import CodableExtensions
import SwiftDate

/*
 Base API Request for every API
*/

class BaseRequest : Encodable {
    
//    @Injected var dateProvider: DateProviderType
//    
//    var timeStamp: String = ""
//        
//    fileprivate enum CodingKeys: String, CodingKey {
//        case timeStamp = "t"
//    }
//    
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(timeStamp, forKey:.timeStamp)
//    }
//    
//     init() throws {
//         let dateProvider = self.dateProvider
//         let now = dateProvider.now
//         self.timeStamp = now.inGMT.toString(.custom(DateFormats.iso8601BLBOFormat))
//    }
}
