//
//  String+HtmlToString.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        return htmlToAttributedString(
            fontFamily: UIFont.systemFont(ofSize: 14, weight: .medium).familyName,
            fontSize: 14
        )
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func htmlToAttributedString(fontFamily: String, fontSize: Int, centerAlign: Bool = false) -> NSMutableAttributedString {
        var modifiedFontString =
            "<span style=\"font-family: " + fontFamily
            + "; font-size: " + fontSize.string
            + "; color: rgb(60, 60, 60)\">" + self + "</span>"
        
        if centerAlign {
            modifiedFontString = "<div style=\"text-align: center;\">" + modifiedFontString + "</div>"
        }
        
        guard let data = modifiedFontString.data(using: .utf8)
            else { return NSMutableAttributedString() }
        
        do {
            return try NSMutableAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
            
        } catch {
            return NSMutableAttributedString()
        }
    }
}
