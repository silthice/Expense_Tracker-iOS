//
//  Login.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import UIKit
import Alamofire

extension APIService {
    func login(username: String, password: String, completionHandler: @escaping (Result<LoginResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/users/login"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters = [
            "username" : username,
            "password": password,
        ]
        
        APIService.publicRequest(url: url, method: .post, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            print("giap check response 1", response)
            switch response {
            case .success(let data):
                if let response: LoginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    DispatchQueue.main.async {
                        completionHandler(.success(response))
                    }
                } else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(APIServiceError.unexpectedError))
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }
}

struct LoginRequest : Codable {
    var username : String = ""
    var password : String = ""
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case password = "password"
    }
    
    init(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
    }
    
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        
    }
}

//struct LoginResponse: Codable {
//    var status: Bool?
//    var errMsg: String?
//    //    var user: User?
//
//    enum CodingKeys: String,CodingKey{
//        case status = "status"
//        case errMsg = "errMsg"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.status = try container.decode(Bool.self, forKey: .status)
//        self.errMsg = try container.decode(String?.self, forKey: .errMsg)
//    }
//}

class LoginResponse: BaseResponse {
//    var status: Bool?
//    var errMsg: String?
    //    var user: User?
    
//    enum CodingKeys: String,CodingKey{
//        case status = "status"
//        case errMsg = "errMsg"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.status = try container.decode(Bool.self, forKey: .status)
//        self.errMsg = try container.decode(String?.self, forKey: .errMsg)
//    }
}
