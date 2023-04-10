//
//  GetTransactionList.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 07/04/2023.
//

import UIKit
import Alamofire

extension APIService {
    func getRecentTransactions(getRecentTransactionRequest: GetTransactionListRequest, completionHandler: @escaping (Result<GetTransactionListResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/transactions/getTransactionList"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters = [
            "t_user_id" : getRecentTransactionRequest.t_user_id,
        ]
        
        APIService.publicRequest(url: url, method: .post, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            switch response {
            case .success(let data):
                if let response: GetTransactionListResponse = try? JSONDecoder().decode(GetTransactionListResponse.self, from: data) {
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
