//
//  App+Logger.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import XCGLogger

typealias LogTag = Tag
extension LogTag {
    static let form = Tag("Form")
    static let objectMapper = Tag("objectMapper")
    static let loginLoginService = Tag("UserLoginService")
    static let realmMigration = Tag("realmMigration")
    static let deeplinking = Tag("deeplinking")
    static let clearup = Tag("clearup")
    static let ui = Tag("ui")
    static let dropDown = Tag("dropDown")
    static let segue = Tag("segue")
    static let network = Tag("network")
    static let presentError = Tag("presentError")
    static let rxSwift = Tag("RxSwift")
    static let notification = Tag("notification")
    static let filter = Tag("filter")
    static let calendarRepository = Tag("calendarRepository")
    static let destruction = Tag("destruction")
    static let cache = Tag("cache")
    static let route = Tag("route")
}

let Log = XCGLogger.default

extension AppDelegate {
    func setupLogger() {
        Log.setup(level: .debug,
                  showThreadName: true,
                  showLevel: true,
                  showFileNames: true,
                  showLineNumbers: true,
                  writeToFile: nil,
                  fileLevel: .debug)
        
        // Filter list they don't want to show in debug log
        let excludeList = [
            Tag.cache,
            Tag.clearup,
            Tag.route
        ]
        Log.filters = [TagFilter(excludeFrom: excludeList)]
    }
}

