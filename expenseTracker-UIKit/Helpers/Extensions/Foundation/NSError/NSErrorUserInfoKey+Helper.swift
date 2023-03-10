//
//  NSErrorUserInfoKey+Helper.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation


extension NSErrorUserInfoKey {
    static let LocalizedDescription:String = NSLocalizedDescriptionKey
    static let LocalizedTitle:String = "kCFErrorLocalizedDescriptionTitleKey"
    static let ApiResponseDictionary:String = "kCFApiResponseDictionaryKey"
    static let ApiResponseObject:String = "kCFApiResponseObjectKey"
    static let UnderlyingError:String = NSUnderlyingErrorKey
}
