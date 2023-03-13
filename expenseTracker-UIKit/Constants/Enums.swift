//
//  Enums.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import SwiftDate

public enum EnumLocale {
    case usEnglish
    var locale: Locale {
        switch self {
        case .usEnglish: return Locale(identifier: "en_US_POSIX")
        }
    }
}

public enum EnumTimeZone {
    case malaysia
    case gmt
    
    var timeZone: TimeZone {
        switch self {
        case .malaysia: return TimeZone(abbreviation: "GMT+8:00")!
        case .gmt: return TimeZone(abbreviation: "GMT+0:00")!
        }
    }
}

public enum EnumRegion {
    case malaysia
    case gmt

    private static let malaysiaRegion = Region(calendar: Calendars.gregorian.toCalendar(),
                                               zone: EnumTimeZone.malaysia.timeZone,
                                               locale: EnumLocale.usEnglish.locale)
    private static let gmtRegion = Region(calendar: Calendars.gregorian.toCalendar(),
                                          zone: EnumTimeZone.gmt.timeZone,
                                          locale: EnumLocale.usEnglish.locale)
    
    var region:Region {
        switch self {
        case .malaysia:
            return EnumRegion.malaysiaRegion
        case .gmt:
            return EnumRegion.gmtRegion
        }
    }
}
