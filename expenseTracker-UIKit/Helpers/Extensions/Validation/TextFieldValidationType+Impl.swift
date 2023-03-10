//
//  TextFieldValidationType+Type.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

public protocol TextFieldValidationType {
    func isNumericOnly(text: String) -> Bool
    func getTextLengthIn(textField: UITextField, range: NSRange, replacementString string: String) -> Int
}

public extension TextFieldValidationType {
    
    func isNumericOnly(text: String) -> Bool {
        let numericSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let compSepByCharInSet = text.components(separatedBy: numericSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return text == numberFiltered
    }
    
    func getTextLengthIn(textField: UITextField, range: NSRange, replacementString string: String) -> Int {
        guard let tfTextCount: Int = textField.text?.count else { return 0 }
        let length = tfTextCount + string.count - range.length
        return length
    }

}
