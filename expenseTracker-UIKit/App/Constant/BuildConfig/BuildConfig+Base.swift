//
//  BuildConfig+Base.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import Foundation

class BaseBuildConfig : BuildConfigType {
    //MARK: Network URL
    var ETBaseURL: URL { return URL(string: "http://localhost:5000/api")! }
    
    //MARK: App
    var localRegion: EnumRegion { return .malaysia }
}
