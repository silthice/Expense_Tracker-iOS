//
//  UIView+Toast.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import Toast_Swift

extension UIView {
    open func showToastDefaultStyle(_ message:String, completion: ((_ didTap: Bool) -> Void)? = nil) {
        self.hideToastActivity()
        var style:ToastStyle = ToastStyle.init()
//        style.messageFont = N8.Fonts.sfProDisplayRegular(size: 15)
        self.makeToast(message, duration: 2, position: .bottom, title: nil, image: nil, style: style) { (ended) in
            guard let completionHandler = completion else { return }
            completionHandler(ended)
        }
    }
    
    open func showToastOnTopStyle(_ message:String, isShowImage: Bool = true, messageColor: UIColor = .black, displaySec: Double = 5, addSafeArea: Bool = false, completion: ((_ didTap: Bool) -> Void)? = nil) {
        self.hideToastActivity()
        var style:ToastStyle = ToastStyle.init()
        style.backgroundColor = .white
        style.messageColor = .black
//        style.messageFont = N8.Fonts.sfProDisplayRegular(size: 15)
        style.imageSize = CGSize(width: 20, height: 20)
        style.cornerRadius = 20
        self.makeToast(message, duration: TimeInterval(displaySec), position: addSafeArea ? .top : .top, title: nil, image: nil, style: style) { (ended) in
            guard let completionHandler = completion else { return }
            completionHandler(ended)
        }
    }
    
    open func showToast(message:String, backgroundColor:UIColor) {
        var style:ToastStyle = ToastStyle.init()
        style.backgroundColor = backgroundColor
//        style.messageFont = N8.Fonts.sfProDisplayRegular(size: 15)
        self.makeToast(message, duration: 0.5, position: .bottom, title: nil, image: nil, style: style) { (ended) in
            
        }
    }
}
