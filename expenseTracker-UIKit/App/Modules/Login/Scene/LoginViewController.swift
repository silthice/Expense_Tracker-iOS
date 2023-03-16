//
//  LoginViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxBiBinding

class LoginViewController: BaseViewController<LoginViewModel> {
    //MARK: - IBOutlets
    @IBOutlet var baseBackgroundView: UIView!
    @IBOutlet weak var logoViewContainer: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loginViewContainer: UIView!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showHidePasswordButton: UIButton!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpGuideLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    //MARK: - Constants
    //MARK: - Vars
    //    var spinner: UIActivityIndicatorView!
    private var activityIndicatorView = UIActivityIndicatorView()
    let allowedCharacterSet = CharacterSet.alphanumerics
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(LoginViewModel.self)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        
        viewModel.loginButtonDidTap = loginButton.rx.tap.asDriver()
        viewModel.signUpButtonDidTap = signUpButton.rx.tap.asDriver()
        viewModel.showHidePasswordButtonDidTap = showHidePasswordButton.rx.tap.asDriver()
    }
    
    override func subscribe() {
        super.subscribe()
        
        disposeBag.insert(
            loginIdTextField.rx.text <-> viewModel.usernameRelay,
            passwordTextField.rx.text <-> viewModel.passwordRelay
        )
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
        
        
        loginIdTextField.delegate = self
        loginIdTextField.autocapitalizationType = .none
        loginIdTextField.autocorrectionType = .no
        loginIdTextField.backgroundColor = .white
        loginIdTextField.borderColor = .lightGray
        loginIdTextField.borderWidth = 1
        loginIdTextField.cornerRadius = 10
        loginIdTextField.layer.masksToBounds = true
        loginIdTextField.textColor = .black
        usernameErrorLabel.textColor = .red
        usernameErrorLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 12)
        
        passwordTextField.delegate = self
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.backgroundColor = .white
        passwordTextField.borderColor = .lightGray
        passwordTextField.borderWidth = 1
        passwordTextField.cornerRadius = 10
        passwordTextField.layer.masksToBounds = true
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        passwordErrorLabel.textColor = .red
        passwordErrorLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 12)
        passwordErrorLabel.numberOfLines = 0
        
        showHidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    }
    
    func setupText() {
        loginIdTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 15)
        ])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 15)
        ])
        
        usernameErrorLabel.text = ""
        passwordErrorLabel.text = ""
        signUpGuideLabel.text = "New to Expense Tracker ?"
        
        loginButton.setTitleWithoutAnimation("LOGIN", for: .normal)
        signUpButton.setTitleWithoutAnimation("SIGN UP", for: .normal)
        
        
        
    }
}

//MARK: - <LoginViewType>
extension LoginViewController: LoginViewType {
    
    func showLoader() {
        self.activityIndicatorView = self.showLoader(view: self.view, isIgnoreInteraction: false)
    }
    
    func dismissLoader() {
        self.activityIndicatorView.dismissLoader()
    }
    
    func showAlert(title: String? = "Error", isError: Bool = false, message: String) {
        var dialogMsg = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        if isError == true {
            let tryAgain = UIAlertAction(title: "Try Again", style: .default, handler: { (action) -> Void in
                
            })
            dialogMsg.addAction(tryAgain)
        } else {
            let ok = UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                self.routeToDashboard()
            })
            
            dialogMsg.addAction(ok)
        }
        
        self.present(dialogMsg, animated: true, completion: nil)
    }
    
    func routeToDashboard() {
        print("giap check routeToDashboard")
    }
    
    func routeToSignup() {
        let screen = DI.container.resolve(SignUpViewControllerType.self)!
        let snapshot = (UIApplication.shared.keyWindow?.snapshotView(afterScreenUpdates: true))!
        let vc = UINavigationController(rootViewController: screen)
        UIApplication.shared.windows.first?.rootViewController = vc
        UIView.transition(with: snapshot,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            snapshot.layer.opacity = 0
        },
                          completion: { status in
            snapshot.removeFromSuperview()
        })
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func toggleShowHidePassword() {
        viewModel.showPassword.accept(!viewModel.showPassword.value)
        passwordTextField.isSecureTextEntry = !viewModel.showPassword.value
        if viewModel.showPassword.value {
            showHidePasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            showHidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    func updateHintContainer(textFieldType: ExpenseTracker.Enum.EnumTextFieldPurposeType, message: String) {
        switch textFieldType {
        case .username:
            self.usernameErrorLabel.text = message
        case .password:
            self.passwordErrorLabel.text = message
        default:
            break
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var maxLength: Int = 18
        if textField == passwordTextField {
            maxLength = 20
        } else {
            maxLength = 18
        }
        //        if textField == passwordTextField {
        
        let currentText = textField.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // make sure the result is under maxLength
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        if newText.count > maxLength {
            return false
        }
        
        // Only allow alphanumeric characters
        let range = newText.rangeOfCharacter(from: allowedCharacterSet.inverted)
        if range != nil {
            return false
        }
        //        }
        return true
    }
}
