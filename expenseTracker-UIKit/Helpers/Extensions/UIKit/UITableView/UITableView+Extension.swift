//
//  UITableView+Extension.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import UIKit

extension UITableView {
    fileprivate struct AssociatedKey {
        static var listEmptyView = "listEmptyView"
    }
    
    var listEmptyView:ListEmptyView {
        get {
            let ret:ListEmptyView = getAssociatedObject(self, associativeKey: &AssociatedKey.listEmptyView)!
            return ret
        }
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.listEmptyView, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func setupListEmptyView(image: UIImage?, title: String?, subtitle: String, isCenter:Bool = true) {
        var f = self.bounds
        f.origin = .zero
        f.origin.y = 0.0//topSpacing
        self.listEmptyView = ListEmptyView(frame: f)
        self.listEmptyView.translatesAutoresizingMaskIntoConstraints = true
        self.listEmptyView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.listEmptyView.config(image: image, title: title, subtitle: subtitle, isCenter: isCenter)
        self.listEmptyView.visibility = .hidden
        self.addSubview(self.listEmptyView)
    }
    
    func listEmptyView(_ visibility: VisibilityState) {
        self.listEmptyView.visibility = visibility
    }
}
