//
//  UserSignUp.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import UIKit
import Alamofire

extension APIService {
    func registerMember(username: String, email: String, password: String, completionHandler: @escaping (Result<RegisterMemberResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/users/signup"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters = [
            "username" : username,
            "email": email,
            "password": password,
        ]
        
        APIService.publicRequest(url: url, method: .post, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            switch response {
            case .success(let data):
                if let response: RegisterMemberResponse = try? JSONDecoder().decode(RegisterMemberResponse.self, from: data) {
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

struct RegisterMemberRequest : Codable {
    var username : String = ""
    var email : String = ""
    var password : String = ""
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case email = "email"
        case password = "password"
    }
    
    init(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
    }
    
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
        
    }
}

struct RegisterMemberResponse: Codable {
    var status: Bool = false
    var errMsg: String?
    //    var user: User?
    
    enum CodingKeys: String,CodingKey{
        case status = "status"
        case errMsg = "errMsg"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.errMsg = try container.decode(String?.self, forKey: .errMsg)
    }
}
