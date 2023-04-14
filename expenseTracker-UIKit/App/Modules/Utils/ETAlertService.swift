//
//  ETAlertService.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import UIKit

enum AlertButtonType {
    case primary
    case secondary
}

class AlertService {
    
    func alert(title: String, message: String, button1Title: String, button2Title: String = String(), completion: @escaping (AlertButtonType) -> Void) -> ETAlertViewController {
        let storyboard = UIStoryboard(name: "ETAlertView", bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "ETAlertView") as! ETAlertViewController
        alertVC.alertTitle = title
        alertVC.alertMessage = message
        alertVC.button1Title = button1Title
        alertVC.button2Title = button2Title
        alertVC.button1Action = completion
        alertVC.button2Action = completion
        return alertVC
    }
}
