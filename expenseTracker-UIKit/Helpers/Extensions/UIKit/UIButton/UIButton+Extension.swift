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
    
    func setButtonTheme(roundedCorner: Bool = false, backgroundColor: UIColor = .white, borderColor: UIColor = ExpenseTracker.Colors.teal_2FEFEF, borderWidth: CGFloat = 0) {
        self.backgroundColor = backgroundColor
        self.setTitleColor(borderColor, for: .normal)
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.layer.cornerRadius = roundedCorner ? (self.height / 2) : 4
    }
    
    func setTitleWithoutAnimation(_ title: String?, for controlState: UIControl.State) {
        UIView.performWithoutAnimation {
            self.setTitle(title, for: controlState)
            self.layoutIfNeeded()
        }
    }
    
}
