//
//  UIButton+Extension.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
extension UIButton {
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(triggerVibrateOnTapped), for: .touchUpInside)
    }

    @objc func triggerVibrateOnTapped () {
        ///Vibrate while typing
    }
    
    func setPrimaryWhiteTheme(roundedCorner: Bool = false){
        self.backgroundColor = .white
        self.setTitleColor(.red, for: .normal)
        self.borderColor = .red
        self.borderWidth = 1
        self.layer.cornerRadius = roundedCorner ? (self.height / 2) : 4
    }
    
    func setPrimaryRedTheme(roundedCorner: Bool = false){
        self.backgroundColor = .red
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = roundedCorner ? (self.height / 2) : 4
    }
}
