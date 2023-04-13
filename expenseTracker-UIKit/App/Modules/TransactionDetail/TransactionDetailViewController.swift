//
//  TransactionDetailViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 11/04/2023.
//

import UIKit
import RxSwift
import RxCocoa

protocol TransactionDetailDelegate {
    func updateCategorySelection(isEarning: Bool, category: Category)
}

class TransactionDetailViewController: BaseViewController<TransactionDetailViewModel> {
    
    //MARK: - IBOutlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var categoryContainer: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var currencyContainer: UIView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var isEarningLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var dateTimeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: - Constants
    var transactionId: String?
    var tempCategoryId: Int?
    var tempIsEarning: Bool?
    var transactionDetail: Transaction?
    //MARK: - Vars
    private var activityIndicatorView = UIActivityIndicatorView()
    var delegate: HomeDelegate!
    
    //MARK: - Dependencies
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(TransactionDetailViewModel.self)!
        viewModel.transactionId.accept(self.transactionId)
    }
    
    override func setupView() {
        super.setupView()
        self.setupUI()
        self.setupText()
    }
    
    override func setupTransformInput() {
        super.setupTransformInput()
        
        viewModel.view = self
        viewModel.startLoad = self.rx.viewWillAppear
        viewModel.backDidTap = backButton.rx.tap.asDriver()
        viewModel.deleteDidTap = deleteButton.rx.tap.asDriver()
        viewModel.categoryDidTap = categoryButton.rx.tap.asDriver()
        viewModel.dateTimeDidTap = dateTimeButton.rx.tap.asDriver()
        viewModel.saveDidTap = saveButton.rx.tap.asDriver()
    }
    
    override func subscribe() {
        super.subscribe()
        
        disposeBag.insert(
        )
    }
    
}

//MARK: - Helper
extension TransactionDetailViewController {
    func setupUI() {
        backButton.tintColor = ExpenseTracker.Colors.teal_2FEFEF
        deleteButton.tintColor = ExpenseTracker.Colors.teal_2FEFEF
        categoryContainer.layer.cornerRadius = 10
        currencyContainer.layer.cornerRadius = 10
        amountTextField.borderStyle = .none
        amountTextField.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 20)
        amountTextField.keyboardType = .numberPad
        saveButton.backgroundColor = ExpenseTracker.Colors.teal_2FEFEF
        saveButton.layer.cornerRadius = 10
        saveButton.setTitleColor(.white, for: .normal)
        isEarningLabel.textColor = .red
        amountTextField.textColor = .red
    }
}

//MARK: - <TransactionDetailViewType>
extension TransactionDetailViewController: TransactionDetailViewType {
    func showLoader() {
        self.activityIndicatorView = self.showLoader(view: self.view, isIgnoreInteraction: false)
    }
    
    func dismissLoader() {
        self.activityIndicatorView.dismissLoader()
    }
    
    func setupText() {
        if let catId = viewModel.transactionDetail.value?.t_cat_id, let isEarning = viewModel.transactionDetail.value?.t_is_income {
            var catName = isEarning ? ExpenseTracker.Enum.EnumIncomeCategory(rawValue: catId)?.getCategoryName : ExpenseTracker.Enum.EnumSpendingCategory(rawValue: catId)?.getCategoryName
            
            titleLabel.text = "Edit \(catName ?? "")"
            categoryLabel.text = catName
        }
        
        currencyLabel.text = ""
        amountTextField.text = viewModel.transactionDetail.value?.t_amt.toString().currencyFormat ?? ""
        dateTimeLabel.text = Date().convertDateWithGMT(dateString: viewModel.transactionDetail.value?.updatedAt ?? "", gmt:"GMT+8", toDateFormat: "dd/MM/yyyy hh:mma ")
        saveButton.setTitle("Save Changes", for: .normal)
        
        if let currency = viewModel.transactionDetail.value?.t_r_name,
            let isEarning = viewModel.transactionDetail.value?.t_is_income {
            
            var finalString = String()
            
            if isEarning {
                finalString = "+ $"
            } else {
                finalString = "- $"
            }
            currencyLabel.text = currency
            isEarningLabel.text = finalString
        }
    }
    
    func dismiss() {
        self.dismiss(animated: true)
    }
    
    func deleteTransaction() {
        print("giap check delete transaction")
    }
    
    func selectCategory() {
        let screen = DI.resolver.resolve(CategorySelectionViewControllerType.self)!
        screen.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) {
            if let sheet = screen.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            }
        }
        screen.modalTransitionStyle = .coverVertical
        screen.isEarning = viewModel.transactionDetail.value?.t_is_income
        screen.tempIsEarning = tempIsEarning
        screen.categoryId = tempCategoryId ?? viewModel.transactionDetail.value?.t_cat_id
        screen.originalTransaction = viewModel.transactionDetail.value
        screen.delegate = self
        self.present(screen, animated: true)
    }
    
    func selectDateTime() {
        print("giap check selectdt transaction")
    }
    
    func save() {
        print("giap check save transaction")
        
        var t_amt: Double = 0
        if let amt = self.amountTextField.text {
            t_amt = Double(amt) ?? 0
        }
        
        viewModel.saveTransactionDetail(
            t_user_id: viewModel.transactionDetail.value?.t_user_id ?? "",
            t_id: viewModel.transactionDetail.value?._id ?? "",
            t_cat_id: viewModel.transactionDetail.value?.t_cat_id ?? 0,
            t_amt: t_amt,
            t_r_id: viewModel.transactionDetail.value?.t_r_id ?? "",
            t_is_income: viewModel.transactionDetail.value?.t_is_income ?? false)
    }
}

//MARK: - TransactionDetailDelegate
extension TransactionDetailViewController: TransactionDetailDelegate {
    func updateCategorySelection(isEarning: Bool, category: Category) {
        titleLabel.text = "Edit \(category.getCategoryName)"
        categoryLabel.text = category.getCategoryName
        isEarningLabel.textColor = isEarning ? ExpenseTracker.Colors.teal_2FEFEF : .red
        amountTextField.textColor = isEarning ? ExpenseTracker.Colors.teal_2FEFEF : .red
        
        var finalString = String()
        
        if isEarning {
            finalString = "+ $"
        } else {
            finalString = "- $"
        }
        isEarningLabel.text = finalString
        tempCategoryId = category.getCategoryRawValue
        tempIsEarning = isEarning
    }
}
