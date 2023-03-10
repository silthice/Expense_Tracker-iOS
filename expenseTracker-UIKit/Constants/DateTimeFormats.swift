//
//  DateTimeFormats.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import SwiftDate

extension DateFormats {
    static let iso8601s = [
        "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'",
        "yyyy-MM-dd'T'HH:mm:ss",
        "yyyy-MM-dd'T'HH:mm:ss.SSS",
        "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'",
        "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
    ]

    static let iso8601WithMiliZ = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let iso8601WithoutZ = "yyyy-MM-dd'T'HH:mm:ss"
    static let iso8601WithMili = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let iso8601BLBOFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    static let yyyyMMdd_HHmmss = "yyyyMMdd_HHmmss"
    
    static let dd_MMM_yyyy = "dd MMM yyyy"
    static let dd_MMM_yyyy_HHmm = "dd MMM yyyy',' hh:mma"
    static let HHmm_dd_MMM_yyyy = "HH:mma',' dd MMM yyyy"
    static let yyyy_MMM = "yyyy MMM"
    static let yyyy = "yyyy"
    static let MMM = "MMM"
    static let MMMM_yyyy = "MMMM yyyy"
    static let MMM_yyyy = "MMM yyyy"
    static let ddMMyyyy_HHmmss = "dd/MM/yyyy HH:mm:ss"
    static let yyyy_MM_dd_HHmmss = "yyyy-MM-dd HH:mm:ss"
    static let yyyyMMdd = "yyyy-MM-dd"
    static let yyyyMMdd_HHmmss_withSlash = "yyyy/MM/dd HH:mm:ss"
    static let yyyy年MM月dd日_HHmmss = "yyyy年 MM月 dd日,HH:mm:ss"
    static let yyyy年MM月dd日 = "yyyy年 MM月 dd日"
    static let yyyy年MM月dd日_HHmm = "yyyy年MM月dd日 HH:mm"
}
