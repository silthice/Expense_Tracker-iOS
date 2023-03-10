//
//  UIView+Compress.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension UIImage {
    func compressImageTo500KB() -> Data? {
        let maxBytes = 500000//1000000
        var compressRatio: CGFloat = 0.09
        var imageData: Data?
            
        while compressRatio > 0 {
            imageData = self.compressedData(quality: compressRatio)
            if maxBytes > imageData?.count ?? 0 {
                break
            } else {
                compressRatio -= 0.01
            }
        }
            
        return imageData
    }
}
