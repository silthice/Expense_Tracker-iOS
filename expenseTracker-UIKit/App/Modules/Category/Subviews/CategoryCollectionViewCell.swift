//
//  CategoryCollectionViewCell.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 13/04/2023.
//

import UIKit
import RxSwift
import RxCocoa

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private(set) var disposeBag = DisposeBag()    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageBackgroundView.layer.cornerRadius = imageBackgroundView.frame.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    private func commonInit() {
        titleLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 12)
    }
    
    func setupView(category: Category, isEarning: Bool, categoryId: Int) {
        titleLabel.text = category.getCategoryName
        imageView.image = category.getCategoryImage
        
        var color = UIColor()
        
        if isEarning {
            color = ExpenseTracker.Colors.teal_2FEFEF
        } else {
            color = .red
        }
        
        if category.getCategoryRawValue == categoryId {
            imageBackgroundView.backgroundColor = color
            imageView.tintColor = .white
        } else {
            imageBackgroundView.backgroundColor = .systemGray6
            imageView.tintColor = .gray
        }
    }
}
