//
//  TransactionCollectionViewCell.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 22/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class TransactionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var transactionCategoryLabel: UILabel!
    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    
    //* MARK: Dependency
    @Injected private var ETKeychain: ETKeyChainType
    private(set) var disposeBag = DisposeBag()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    private func commonInit() {
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.layer.cornerRadius = 5
        cellBackgroundView.clipsToBounds = true
//        transactionCategoryLabel.textColor = ExpenseTracker.Colors.grey_EFEFEF
        transactionCategoryLabel.textColor = .black
        transactionCategoryLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 14)
        
//        transactionDateLabel.textColor = ExpenseTracker.Colors.grey_EFEFEF
        transactionDateLabel.textColor = .lightGray
        transactionDateLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 12)
        
        transactionAmountLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 20)
        
        
    }
    
    func setupView(transaction: Transaction) {
        self.transactionCategoryLabel.text = transaction.t_cat_name
        self.transactionDateLabel.text = Date().convertDateWithGMT(dateString: transaction.updatedAt ?? "", gmt:"GMT+8", toDateFormat: "dd/MM/yyyy hh:mma ")
        self.transactionAmountLabel.textColor = transaction.t_is_income ? ExpenseTracker.Colors.teal_2FEBEB : .red
        self.transactionAmountLabel.text = (transaction.t_is_income ? "+" : "-") + (ETKeychain.getCurrencyCode() ?? "") +  convertToPrefCurrency(transaction: transaction)
    }
    
    func convertToPrefCurrency(transaction: Transaction) -> String {
        if let rateName = transaction.t_r_name {
            if rateName != ETKeychain.getCurrencyCodeString() {
                return "\((transaction.t_amt / transaction.t_rate_during_transaction).toString().currencyFormat)"
            }
        }
        return "\(transaction.t_amt.toString().currencyFormat)"
    }

}

extension Reactive where Base: TransactionCollectionViewCell {
    var cellDidTap: Driver<Void> { return Driver.merge(base.cellButton.rx.tap.asDriver())}
}
