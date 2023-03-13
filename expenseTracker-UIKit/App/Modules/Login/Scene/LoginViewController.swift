//
//  LoginViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController<LoginViewModel> {
    //MARK: - IBOutlets
    @IBOutlet var baseBackgroundView: UIView!
    @IBOutlet weak var logoViewContainer: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loginViewContainer: UIView!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpGuideLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    //MARK: - Constants
    //MARK: - Vars
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(LoginViewModel.self)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func setupView() {
        super.setupView()
        self.setupUI()
        self.setupText()
    }
    
    override func setupTransformInput() {
        super.setupTransformInput()
        
        viewModel.view = self
        viewModel.startLoad = self.rx.viewDidLoad
        viewModel.startExit = rx.viewWillDisappear
    }
    
    override func subscribe() {
        super.subscribe()
    }
}


//MARK: - Helper
extension LoginViewController {
    func setupUI() {
        baseBackgroundView.backgroundColor = ExpenseTracker.Colors.grey_EFEFEF
        backgroundView.backgroundColor = ExpenseTracker.Colors.teal_2FEBEB
        logoViewContainer.backgroundColor = .white
        logoViewContainer.cornerRadius = 20
        backgroundView.cornerRadius = 30
        loginViewContainer.cornerRadius = 30
        loginLabel.textColor = .black
        loginLabel.font = ExpenseTracker.Fonts.sfProDisplayBold(size: 25)
        loginButton.backgroundColor = ExpenseTracker.Colors.teal_2FEBEB
        loginButton.cornerRadius = 22.5
        loginButton.titleLabel?.font = ExpenseTracker.Fonts.sfProDisplayBold(size: 15)
        
        signUpGuideLabel.textColor = .black
        signUpGuideLabel.font = ExpenseTracker.Fonts.sfProDisplaySemibold(size: 12)
        signUpButton.titleLabel?.font = ExpenseTracker.Fonts.sfProDisplayBold(size: 12)
        signUpButton.setTitleColor(ExpenseTracker.Colors.teal_2FEBEB, for: .normal)
        
        
        loginIdTextField.autocapitalizationType = .none
        loginIdTextField.autocorrectionType = .no
        loginIdTextField.backgroundColor = .white
        loginIdTextField.borderColor = .lightGray
        loginIdTextField.borderWidth = 1
        loginIdTextField.cornerRadius = 10
        loginIdTextField.layer.masksToBounds = true
        loginIdTextField.textColor = .black
        
        
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.backgroundColor = .white
        passwordTextField.borderColor = .lightGray
        passwordTextField.borderWidth = 1
        passwordTextField.cornerRadius = 10
        passwordTextField.layer.masksToBounds = true
        passwordTextField.textColor = .black
        
    }
    
    func setupText() {
        loginIdTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 18)
        ])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 18)
        ])
        
        signUpGuideLabel.text = "New to Expense Tracker ?"
        loginButton.setTitle("LOGIN", for: .normal)
        signUpButton.setTitle("SIGN UP", for: .normal)
        
    }
}

//MARK: - <LoginViewType>
extension LoginViewController: LoginViewType {
    
}
