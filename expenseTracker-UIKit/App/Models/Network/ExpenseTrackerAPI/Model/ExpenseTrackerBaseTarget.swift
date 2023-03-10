//
//  ExpenseTrackerBaseTarget.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import Alamofire
import SwiftyUserDefaults

class UntypedBaseTarget: TargetType {
    
    @Injected var buildConfig: BuildConfigType
    
    //<TargetType>
    var baseURL: URL { return buildConfig.n8BaseURL }
    
    var path: String { return "" }
    
    var method: Moya.Method { return .post }
    
    var sampleData: Data { return Data() }
    
    var task: Task { return .requestPlain }
    
    var headers: [String : String]? { return nil }
    
    var createSignatureForRequest: Bool { return true }
    
    var validateSignatureForResponse: Bool { return true }
}

struct JSONStringArrayEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        var data: Data = Data()
        if #available(iOS 13.0, *) {
            data = try JSONSerialization.data(withJSONObject: parameters!, options: [.sortedKeys, .withoutEscapingSlashes])
        } else {
            data = try JSONSerialization.data(withJSONObject: parameters!, options: JSONSerialization.WritingOptions.sortedKeys)
        }
        
        let json = NSString(data: data, encoding: 8)
        if let json = json {
            let newJson = json.replacingOccurrences(of: "\\/", with: "/").nsString
            
            let dataString = data.string(encoding: .utf8).orEmpty
            let utf8String = dataString.utf8
            let finalHttpData = Data(utf8String)
            
            
            urlRequest.httpBody = finalHttpData
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        }
        
        /// For IM - to filter out sub event
        urlRequest.setValue("3.0", forHTTPHeaderField: "ipis-version")
        
        urlRequest.setValue("*", forHTTPHeaderField: "Accept-Language")
        urlRequest.setValue("deflate, gzip;q=1.0, *;q=0.5", forHTTPHeaderField: "Accept-Encoding")
        urlRequest.setValue("Identity", forHTTPHeaderField: "Transfer-Encoding")
        urlRequest.setValue(Defaults[DefaultsKeys.UserPref.xTimestamp], forHTTPHeaderField: "x-Timestamp")
        
        /// BB Header
        urlRequest.setValue(UserSettingCenter.bbToken, forHTTPHeaderField: "Authorization")
  
        return urlRequest
    }
}

class BaseTarget<I, O>: UntypedBaseTarget {
    var i: I!
    
    override var task: Task {
        if let parameters = i as? Encodable {
            return .requestParameters(parameters: parameters.dictionary ?? [:], encoding: JSONStringArrayEncoding())
        } else {
            return super.task
        }
    }
    
    init(input: I) {
        self.i = input
    }
}


