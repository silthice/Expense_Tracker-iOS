//
//  ETAlertViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 14/04/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxBiBinding

class ETAlertViewController: BaseViewController<ETAlertViewModel> {
    //MARK: - IBOutlets
    @IBOutlet weak var alertContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    //MARK: - Constants
    
    //MARK: - Vars
    var alertTitle = String()
    var alertMessage = String()
    var button1Title = String()
    var button2Title = String()
    var button1Action: ((AlertButtonType) -> Void)?
    var button2Action: ((AlertButtonType) -> Void)?
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(ETAlertViewModel.self)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func setupView() {
        super.setupView()
        alertContainerView.layer.cornerRadius = 10
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        
        titleLabel.font = ExpenseTracker.Fonts.sfProDisplaySemibold(size: 18)
        titleLabel.textColor = .black

        messageLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 15)
        messageLabel.textColor = .gray

        if button1Title != String() {
            button1.setTitle(button1Title, for: .normal)
            button1.setButtonTheme(backgroundColor: ExpenseTracker.Colors.teal_2FEFEF, borderColor: .white)
            button1.titleLabel?.font = ExpenseTracker.Fonts.sfProDisplayBold(size: 15)
        }
        if button2Title != String() {
            button2.setTitle(button2Title, for: .normal)
            button2.setButtonTheme(borderWidth: 1)
            button2.titleLabel?.font = ExpenseTracker.Fonts.sfProDisplaySemibold(size: 15)
            button2.isHidden = false
        }
    }
    
    override func setupTransformInput() {
        super.setupTransformInput()
        
        viewModel.view = self
        viewModel.button1DidTap = button1.rx.tap.asDriver()
        viewModel.button2DidTap = button2.rx.tap.asDriver()
        viewModel.button1Action = button1Action
        viewModel.button2Action = button2Action
    }
    
    override func subscribe() {
        super.subscribe()
        
        disposeBag.insert(
        )
    }
}


//MARK: - Helper
extension ETAlertViewController {
    func setupUI() {
    }
    
    func setupText() {
    }
}

//MARK: - <ETAlertViewType>
extension ETAlertViewController: ETAlertViewType {
    func dismiss() {
        self.dismiss(animated: true)
    }
}
