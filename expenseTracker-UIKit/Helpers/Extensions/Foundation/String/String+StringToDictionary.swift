//
//  String+StringToDictionary.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension String {
    var toDictionary: [String:AnyObject]? {
        return convertStringToDictionary(text: self)
    }
}

func convertStringToDictionary(text: String) -> [String:AnyObject]? {
    if let data = text.data(using: .utf8) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
            return json
        } catch {
            print("Convert String to Dictionary went wrong")
        }
    }
    return nil
}
