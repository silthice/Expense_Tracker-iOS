//
//  SaveTransactionDetail.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 12/04/2023.
//

import UIKit
import Alamofire

extension APIService {
    func editTransactionDetail(saveTransactionDetailRequest: SaveTransactionDetailRequest, completionHandler: @escaping (Result<SaveTransactionDetailResponse, Error>) -> Void){
        let urlString = "\(buildConfig.ETBaseURL)" + "/transactions/edit"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(.failure(APIServiceError.invalidUrl))
            }
            return
        }
        
        let parameters: [String: Any] = [
            "t_user_id" : saveTransactionDetailRequest.t_user_id,
            "t_id" : saveTransactionDetailRequest.t_id,
            "t_cat_id" : saveTransactionDetailRequest.t_cat_id,
            "t_amt" : saveTransactionDetailRequest.t_amt,
            "t_r_id" : saveTransactionDetailRequest.t_r_id,
            "t_is_income" : saveTransactionDetailRequest.t_is_income,
        ]
        
        APIService.publicRequest(url: url, method: .put, parameters: parameters, headers: HTTPHeaders.jsonHeader()) { (response) in
            
            switch response {
            case .success(let data):
                if let response: SaveTransactionDetailResponse = try? JSONDecoder().decode(SaveTransactionDetailResponse.self, from: data) {
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
