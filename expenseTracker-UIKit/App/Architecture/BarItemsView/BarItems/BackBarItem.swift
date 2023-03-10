//
//  BackBarItem.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension BarItem {
    static func back(closure: ((UIViewController)->())? = BackBarItem.defaultClosure) -> BarItem {
        let ret = BackBarItem()
        ret.closure = closure
        return ret
    }
}

class BackBarItem: BarItem {
    static let defaultId = "back"
    
    class func defaultClosure(_ vc:UIViewController) {
        vc.popWithResult()
    }
    
    init() {
        super.init(id: BackBarItem.defaultId)
    }
    
    override func createBarButtonItem() -> UIBarButtonItem? {
        let image:UIImage
        if #available(iOS 13.0, *) {
            image = UIImage(systemName: "chevron.left")!
        } else {
            image = UIImage(systemName: "chevron.left")!
//            image = N8.Images.n8BaseArrowLeftIcon
        }
        let item = UIBarButtonItem(image:image , style: .plain, target: self, action: #selector(self.performAction(sender:)))
        item.imageInsets = .zero
        item.tintColor = .white
        
        return item
    }
}

class LabelBarItem: BarItem {
    static let defaultId = "label"
    
    
    class func defaultClosure(_ vc:UIViewController) {
        vc.popWithResult()
    }
    init() {
        super.init(id: BackBarItem.defaultId)
    }
    
    override func createBarButtonItem() -> UIBarButtonItem? {
        let image:UIImage
        if #available(iOS 13.0, *) {
            image = UIImage(systemName: "chevron.left")!
        } else {
            image = UIImage(systemName: "chevron.left")!
//            image = N8.Images.n8BaseArrowLeftIcon
        }
        let item = UIBarButtonItem(image:image , style: .plain, target: self, action: #selector(self.performAction(sender:)))
        item.imageInsets = .zero
        return item
    }
}









