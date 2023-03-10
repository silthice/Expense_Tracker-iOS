//
//  CloseBarItem.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension BarItem {
    static func close(tintColor: UIColor? = nil, closure: ((UIViewController)->())? = BackBarItem.defaultClosure) -> BarItem {
        let ret = CloseBarItem()
        ret.closure = closure
        ret.tintColor = tintColor
        return ret
    }
}


class CloseBarItem: BarItem {
    static let defaultId = "close"
    var tintColor: UIColor?
    
    class func defaultClosure(_ vc:UIViewController) {
        vc.popWithResult()
    }
    init() {
        super.init(id: CloseBarItem.defaultId)
    }
    override func createBarButtonItem() -> UIBarButtonItem? {
        let image:UIImage
        if #available(iOS 13.0, *) {
            image = UIImage(systemName: "xmark")!
        } else {
//            image = N8.Images.navBarIconClose
            image = UIImage(systemName: "xmark")!
            
        }
        let item = UIBarButtonItem(image:image , style: .plain, target: self, action: #selector(self.performAction(sender:)))
        item.imageInsets = .zero
        
        if let customTint = self.tintColor {
            item.tintColor = customTint
        }
    
        return item
    }
}
