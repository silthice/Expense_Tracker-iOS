//
//  SignUp.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 16/03/2023.
//

import UIKit
import Alamofire

extension APIService {
    func signUp(signUpRequest: SignUpRequest, completionHandler: @escaping (Result<SignUpResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/users/signup"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters = [
            "username" : signUpRequest.username,
            "email": signUpRequest.email,
            "password": signUpRequest.password,
        ]
        
        APIService.publicRequest(url: url, method: .post, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            switch response {
            case .success(let data):
                if let response: SignUpResponse = try? JSONDecoder().decode(SignUpResponse.self, from: data) {
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
