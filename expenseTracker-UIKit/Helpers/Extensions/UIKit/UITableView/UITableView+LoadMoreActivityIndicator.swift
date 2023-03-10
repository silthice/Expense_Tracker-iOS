//
//  UITableView+LoadMoreActivityIndicator.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit

extension UITableView {

    func indicatorView(loadMoreString: String) -> UIView { //UIActivityIndicatorView{
        var activityIndicatorView = UIActivityIndicatorView()
        let viewForActivityIndicator = UIView()
        let loadingTextLabel = UILabel()
        
        if self.tableFooterView == nil {
            viewForActivityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: 80)
            viewForActivityIndicator.backgroundColor = .clear
            
            let indicatorFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 40)
            activityIndicatorView = UIActivityIndicatorView(frame: indicatorFrame)
            activityIndicatorView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
            if #available(iOS 13.0, *) {
                activityIndicatorView.style = .medium
            } else {
                // Fallback on earlier versions
                activityIndicatorView.style = .gray
            }
            activityIndicatorView.hidesWhenStopped = true
            
            loadingTextLabel.textColor = UIColor.init(white: 160.0 / 255.0, alpha: 1.0)
            loadingTextLabel.text = loadMoreString
            loadingTextLabel.font = UIFont.systemFont(ofSize: 14.0)
            loadingTextLabel.sizeToFit()
            loadingTextLabel.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y + 20)
            viewForActivityIndicator.addSubview(loadingTextLabel)
            
            activityIndicatorView.startAnimating()
            activityIndicatorView.center = CGPoint.init(x: loadingTextLabel.frame.origin.x - 18.0, y: loadingTextLabel.center.y)
            viewForActivityIndicator.addSubview(activityIndicatorView)

            self.tableFooterView = viewForActivityIndicator
            return viewForActivityIndicator
        }
        else {
            return activityIndicatorView
        }
    }

    func addLoading(_ indexPath:IndexPath, loadMoreString: String = "更多", closure: @escaping (() -> Void)){
        self.indicatorView(loadMoreString: loadMoreString).visibility = .visible
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            closure()
        }
    }

    func stopLoading(loadMoreString: String = "更多") {
        if self.tableFooterView != nil {
            self.indicatorView(loadMoreString: loadMoreString).visibility = .hidden
        }
        self.tableFooterView = nil
    }
}

