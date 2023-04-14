//
//  DeleteTransaction.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import UIKit
import Alamofire

extension APIService {
    func deleteTransaction(deleteTransactionRequest: DeleteTransactionRequest, completionHandler: @escaping (Result<DeleteTransactionResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/transactions/delete"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters: [String: Any] = [
            "t_user_id" : deleteTransactionRequest.t_user_id,
            "t_id" : deleteTransactionRequest.t_id,
        ]
        
        APIService.publicRequest(url: url, method: .delete, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            switch response {
            case .success(let data):
                if let response: DeleteTransactionResponse = try? JSONDecoder().decode(DeleteTransactionResponse.self, from: data) {
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
