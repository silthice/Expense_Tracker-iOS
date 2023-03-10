//
//  ListEmptyView.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import Foundation
import NibDesignable

class ListEmptyView: NibDesignable {
    
    @IBOutlet weak var emptyStateImageView: UIImageView!
    @IBOutlet weak var spacerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var spacer15View: UIView!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "".orEmptyReplacement
        self.subTitleLabel.text = "".orEmptyReplacement
        self.emptyStateImageView.image = UIImage()
    }
    
     //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.font = self.bounds.height < 200 ? UIFont.systemFont(ofSize: 20, weight: .bold) : UIFont.systemFont(ofSize: 24, weight: .bold)
        subTitleLabel.font = self.bounds.height < 200 ? UIFont.systemFont(ofSize: 13, weight: .regular) : UIFont.systemFont(ofSize: 15, weight: .regular)
        
        spacerView.visibility = (self.bounds.height > 200).visibility
        spacer15View.visibility = (self.bounds.height > 200).visibility
    }
    
    private func commonInit() {
        titleLabel.textColor = .red
        subTitleLabel.textColor = .black
    }
    
    func config(image: UIImage?, title: String?, subtitle: String, isCenter:Bool = true) {
        self.titleLabel.text = title?.orEmptyReplacement.htmlToString
        self.subTitleLabel.text = subtitle.orEmptyReplacement.htmlToString
        self.emptyStateImageView.image = image
    }
    
}
