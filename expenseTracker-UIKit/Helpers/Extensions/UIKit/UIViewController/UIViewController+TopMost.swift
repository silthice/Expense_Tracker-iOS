//
//  UIViewController+TopMost.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension UIViewController {
    var topMost: UIViewController {
        let vc = self
        var ret:UIViewController = vc
        repeat {
            if let presented = ret.presentedViewController {
                ret = presented
            } else {
                break
            }
        } while(true)
        return ret
    }
    
    var bottomMost: UIViewController {
        let vc = self
        var ret:UIViewController = vc
        repeat {
            if let presenting = ret.presentingViewController {
                ret = presenting
            } else {
                break
            }
        } while(true)
        return ret
    }
    
    var keyRootTopMost: UIViewController {
        return UIViewController.keyRoot.topMost
    }
    
    var keyRootBottomMost: UIViewController {
        return UIViewController.keyRoot.bottomMost
    }
    
    static var keyRoot: UIViewController {
        return UIApplication.shared.keyWindow!.rootViewController!
    }
}

