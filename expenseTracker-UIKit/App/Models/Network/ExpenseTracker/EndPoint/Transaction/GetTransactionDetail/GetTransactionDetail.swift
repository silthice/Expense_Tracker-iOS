//
//  GetTransactionDetail.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/04/2023.
//

import UIKit
import Alamofire

extension APIService {
    func getTransactionDetail(getTransactionDetailRequest: GetTransactionDetailRequest, completionHandler: @escaping (Result<GetTransactionDetailResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/transactions/getTransactionDetail"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters = [
            "t_user_id" : getTransactionDetailRequest.t_user_id,
            "t_id" : getTransactionDetailRequest.t_id,
        ]
        
        APIService.publicRequest(url: url, method: .post, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            switch response {
            case .success(let data):
                if let response: GetTransactionDetailResponse = try? JSONDecoder().decode(GetTransactionDetailResponse.self, from: data) {
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
