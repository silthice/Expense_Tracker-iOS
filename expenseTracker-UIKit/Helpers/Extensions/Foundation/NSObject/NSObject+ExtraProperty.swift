//
//  NSObject+ExtraProperty.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation

extension NSObject {
    fileprivate struct AssociatedKey {
        static var link = "link"
        static var data = "data"
        static var name = "name"
        static var id = "id"
    }
    
    @IBInspectable var aoName:String? {
        get {
            let ret:String? = getAssociatedObject(self, associativeKey: &AssociatedKey.name)
            return ret
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.name, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @IBInspectable var aoLink: String? {
        get {
            let ret:String? = getAssociatedObject(self, associativeKey: &AssociatedKey.link)
            return ret
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.link, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var aoData: AnyObject? {
        get {
            let ret:AnyObject? = getAssociatedObject(self, associativeKey: &AssociatedKey.data)
            return ret
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.data, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @IBInspectable var aoId:String? {
        get {
            let ret:String? = getAssociatedObject(self, associativeKey: &AssociatedKey.id)
            return ret
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.id, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
