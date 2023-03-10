//
//  SwiftDateExtensions.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import SwiftDate

extension Region {
    static var malaysia: Region {
        return EnumRegion.malaysia.region
    }
    static var gmt: Region {
        return EnumRegion.gmt.region
    }
    static var local: Region {
        let buildConfig = DI.resolver.resolve(BuildConfigType.self)!
        return buildConfig.localRegion.region
    }
}

extension DateInRegion {
    var inMalaysia: DateInRegion {
        return DateInRegion(self.date, region: .malaysia)
    }
    var inGMT: DateInRegion {
        return DateInRegion(self.date, region: .gmt)
    }
    var inLocal: DateInRegion {
        return DateInRegion(self.date, region: .local)
    }
    static var now: DateInRegion {
        let now = DI.resolver.resolve(DateProviderType.self)!.now
        return DateInRegion(now.date, region: .local)
    }
}

extension Date {
    static let currentTimeZone = TimeZone.current.localizedName(for: .shortStandard, locale: nil)
    
    var inMalaysia: DateInRegion {
        return DateInRegion(self, region: .malaysia)
    }
    var inGMT: DateInRegion {
        return DateInRegion(self, region: .gmt)
    }
    var inLocal: DateInRegion {
        return DateInRegion(self, region: .local)
    }
    static var now: Date {
        let now = DI.resolver.resolve(DateProviderType.self)!.now
        return now.date
    }
    
    func getTodayDateTimeInGMT(_ gmt: String) -> String {
        let today = Date()
        let df = DateFormatter()
        df.timeZone = TimeZone(abbreviation: gmt)
        df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
        return df.string(from: today)
    }
    
    func getTodayDateTime() -> String {
        let today = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return df.string(from: today)
    }
    
    func getTodayDate() -> String {
        let today = Date()
        let df = DateFormatter()
        df.timeZone = TimeZone(abbreviation: "GMT-4")
        df.dateFormat = "yyyy-MM-dd"
        return df.string(from: today)
    }
    
    func getDateTimeAfterDateTime(initialDate: String, dayCount: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: initialDate) else { return "" }
        
        let dateAfter = Calendar.current.date(byAdding: .day, value: dayCount, to: date) ?? Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df.string(from: dateAfter)
    }
    
    func convertDateWithGMT(dateString: String, gmt: String, toDateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: gmt)
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = toDateFormat
            let displayString = dateFormatter.string(from: date)
            return displayString
        }
        else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatter.timeZone = TimeZone(abbreviation: gmt)
            if let date = dateFormatter.date(from: dateString) {
                dateFormatter.timeZone = TimeZone.current
                dateFormatter.dateFormat = toDateFormat
                let displayString = dateFormatter.string(from: date)
                return displayString
            }
            else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                dateFormatter.timeZone = TimeZone(abbreviation: gmt)
                if let date = dateFormatter.date(from: dateString) {
                    dateFormatter.timeZone = TimeZone.current
                    dateFormatter.dateFormat = toDateFormat
                    let displayString = dateFormatter.string(from: date)
                    return displayString
                }
            }
        }
        
        return ""
    }
    
    func convertDate(dateString: String,fromDateFormat: String = DateFormats.iso8601WithoutZ, toDateFormat: String = DateFormats.yyyy_MM_dd_HHmmss) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromDateFormat
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = toDateFormat
            let displayString = dateFormatter.string(from: date)
            return displayString
        }
        return ""
    }
    
    func convertTimestampToDateString(timestamp: String, toDateFormat: String) -> String {
        guard timestamp.count > 10 else { return "" }
        let interval = TimeInterval(Double((timestamp as NSString).substring(to: 10)) ?? 0.0)
        let date = Date(timeIntervalSince1970: interval)
        
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSZ"
//        dateFormatter.timeZone = TimeZone(abbreviation: gmt)
        dateFormatter.dateFormat = toDateFormat
        let displayString = dateFormatter.string(from: date)
        return displayString
    }
    
    func convertDateStringToTimestamp(dateString: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: dateString) {
            return Int(date.timeIntervalSince1970) * 1000
        }
        return 0
    }
    
    func convertUnixTimeToTimeString(timeString: String, gmt: String) -> String {
        
        if let unixTime = timeString.count > 10 ? Int(timeString.prefix(10)) : Int(timeString) {
            let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
            let iso8601DateFormatter = ISO8601DateFormatter()
            iso8601DateFormatter.formatOptions = [.withInternetDateTime]
            iso8601DateFormatter.timeZone = TimeZone(abbreviation: gmt)
            
            var formattedDateTimeString = iso8601DateFormatter.string(from: date)
            //shortcut to remove gmt abbreviation of "+08:00"
            formattedDateTimeString.removeLast(6)
            return formattedDateTimeString
        }
        return ""
    }
}

