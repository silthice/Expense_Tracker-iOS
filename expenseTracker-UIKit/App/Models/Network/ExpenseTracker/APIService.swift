//
//  APIService.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//
import Foundation
import UIKit
import Alamofire
import SwifterSwift
import Moya
import SwiftyUserDefaults

extension HTTPHeaders {
    static func jsonHeader() -> HTTPHeaders {
        //        let headers:HTTPHeaders = HTTPHeaders.init([
        //            "Content-Type": "application/json;charset=UTF-8",
        //            "x-Timestamp": Defaults[DefaultsKeys.UserPref.xTimestamp]
        //        ])
        let headers:HTTPHeaders = HTTPHeaders.init([
            "Content-Type": "application/json;charset=UTF-8",
            "Authorization": ETKeyChain().getBearerToken() ?? "",
        ])
        return headers
    }
}

/// Service Error Enum
enum APIServiceError: Error {
    case invalidUrl
    case unexpectedError
    case noData
    case noInternet
}

extension APIServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .unexpectedError:
            return "Unexpected error"
        case .noData:
            return "No data found"
        case .noInternet:
            return "Internet connection not found"
        }
    }
}

//* MARK: - APIService
class APIService: NSObject {
    @Injected var buildConfig: BuildConfigType
    
    class func publicRequest(url: URL,
                             method: HTTPMethod,
                             parameters: Parameters? = nil,
                             headers: HTTPHeaders? = HTTPHeaders.jsonHeader(),
                             completionHandler: @escaping (Result<Data, Error>) -> Void) {
        
        APIService.request(url: url, method: method, parameters: parameters, headers: headers, completionHandler: completionHandler)
    }
    
    private class func request(url: URL,
                               method: HTTPMethod,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = HTTPHeaders.jsonHeader(),
                               completionHandler: @escaping (Result<Data, Error>) -> Void) {
        
        let encoding = JSONEncoding.default
        
        
//        print("giap check apiservice request", url, method)
//        print("giap check apiservice request", parameters)
//        print("giap check apiservice request", headers)
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200...500)
            .response { dataResponse in
//                print("giap check api service data response", dataResponse.response?.statusCode)
                switch dataResponse.result {
                case .success(let data):
                    guard let data = data else {
                        completionHandler(.failure(APIServiceError.noData))
                        return
                    }
                    
                    /// Pretty print out the API data
                    let path = url.absoluteString
                    let headerDebugString : String
                    if dataResponse.response?.allHeaderFields == nil || (dataResponse.response?.allHeaderFields)!.isEmpty {
                        headerDebugString = "\n[Missing http response header]"
                    } else {
                        let headerJSONString = dataResponse.response?.allHeaderFields.jsonString(prettify: true) ?? ""
                        headerDebugString = "\nHttp response header : \(headerJSONString)"
                    }
                    do {
                        let body = try data.prettyPrintedJSONString()
                        
                        print("[\(path): \(headerDebugString)\nHttp response body[\(data.count) bytes] :\n\(body)\n")
                    } catch {
                        let body = data.string(encoding: .utf8) ?? ""
                        print("[\(path): \(headerDebugString)\nHttp response body[\(data.count) bytes] :\n\(body)\n")
                    }
                    
                    //handle all response since validate statusCode 200...500
                    DispatchQueue.main.async {
                        completionHandler(.success(data))
                    }
                    
                case .failure(let error):
                    if error.isResponseSerializationError {
                        DispatchQueue.main.async {
                            completionHandler(.failure(APIServiceError.unexpectedError))
                        }
                        return
                    }
                    
                    DispatchQueue.main.async {
                        completionHandler(.failure(error))
                    }
                }
            }
    }
}

