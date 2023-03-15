//
//  Login.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/03/2023.
//

import UIKit
import Alamofire

extension APIService {
    func login(loginRequest: LoginRequest, completionHandler: @escaping (Result<LoginResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/users/login"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters = [
            "username" : loginRequest.username,
            "password": loginRequest.password,
        ]
        
        APIService.publicRequest(url: url, method: .post, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            switch response {
            case .success(let data):
                do {
                    let response: LoginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(response))
                    }
                } catch {
                    print("Decode login response error", error)
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

