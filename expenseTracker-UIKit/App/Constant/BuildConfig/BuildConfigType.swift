//
//  BuildConfigType.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

protocol BuildConfigType {
    //MARK: Network URL
    var ETBaseURL: URL { get }
    //MARK: App
    var localRegion: EnumRegion { get }
}

//class BuildConfigType {
//    var ETBaseURL: URL { return URL(string: "http://localhost/api")! }
//    
//    //MARK: App
//    var localRegion: EnumRegion { return .malaysia }
//}
