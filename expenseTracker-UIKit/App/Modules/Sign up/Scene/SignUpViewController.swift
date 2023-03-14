//
//  SignUpViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxBiBinding

class SignUpViewController: BaseViewController<SignUpViewModel> {
    //MARK: - IBOutlets
    @IBOutlet var baseBackgroundView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoViewContainer: UIView!
    
    @IBOutlet weak var signUpViewContainer: UIView!
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var showHidePasswordButton: UIButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    @IBOutlet weak var showConfirmHidePasswordButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginGuideLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Constants
    //MARK: - Vars
    let allowedCharacterSet = CharacterSet.alphanumerics
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(SignUpViewModel.self)!
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
        
        viewModel.signUpButtonDidTap = signUpButton.rx.tap.asDriver()
        viewModel.loginButtonDidTap = loginButton.rx.tap.asDriver()
        viewModel.showHidePasswordButtonDidTap = showHidePasswordButton.rx.tap.asDriver()
        viewModel.showHideConfirmPasswordButtonDidTap = showConfirmHidePasswordButton.rx.tap.asDriver()
    }
    
    override func subscribe() {
        super.subscribe()
        
        disposeBag.insert(
            userNameTextField.rx.text <-> viewModel.usernameRelay,
            emailTextField.rx.text <-> viewModel.emailRelay,
            passwordTextField.rx.text <-> viewModel.passwordRelay,
            confirmPasswordTextField.rx.text <-> viewModel.confirmPasswordRelay
        )
    }
}


//MARK: - Helper
extension SignUpViewController {
    func setupUI() {
        self.leftBarItem = .back()
        baseBackgroundView.backgroundColor = ExpenseTracker.Colors.grey_EFEFEF
        backgroundView.backgroundColor = ExpenseTracker.Colors.teal_2FEBEB
        logoViewContainer.backgroundColor = .white
        logoViewContainer.cornerRadius = 20
        backgroundView.cornerRadius = 30
        signUpViewContainer.cornerRadius = 30
        signUpLabel.textColor = .black
        signUpLabel.font = ExpenseTracker.Fonts.sfProDisplayBold(size: 25)
        signUpButton.backgroundColor = ExpenseTracker.Colors.teal_2FEBEB
        signUpButton.cornerRadius = 22.5
        signUpButton.titleLabel?.font = ExpenseTracker.Fonts.sfProDisplayBold(size: 15)
        
        userNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        userNameTextField.autocapitalizationType = .none
        userNameTextField.autocorrectionType = .no
        userNameTextField.backgroundColor = .white
        userNameTextField.borderColor = .lightGray
        userNameTextField.borderWidth = 1
        userNameTextField.cornerRadius = 10
        userNameTextField.layer.masksToBounds = true
        userNameTextField.textColor = .black
        usernameErrorLabel.textColor = .red
        usernameErrorLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 12)
        usernameErrorLabel.numberOfLines = 0
        
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.backgroundColor = .white
        emailTextField.borderColor = .lightGray
        emailTextField.borderWidth = 1
        emailTextField.cornerRadius = 10
        emailTextField.layer.masksToBounds = true
        emailTextField.textColor = .black
        emailTextField.keyboardType = .emailAddress
        emailErrorLabel.textColor = .red
        emailErrorLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 12)
        emailErrorLabel.numberOfLines = 0
        
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
        
        confirmPasswordTextField.autocapitalizationType = .none
        confirmPasswordTextField.autocorrectionType = .no
        confirmPasswordTextField.backgroundColor = .white
        confirmPasswordTextField.borderColor = .lightGray
        confirmPasswordTextField.borderWidth = 1
        confirmPasswordTextField.cornerRadius = 10
        confirmPasswordTextField.layer.masksToBounds = true
        confirmPasswordTextField.textColor = .black
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordErrorLabel.textColor = .red
        confirmPasswordErrorLabel.font = ExpenseTracker.Fonts.sfProDisplayRegular(size: 12)
        confirmPasswordErrorLabel.numberOfLines = 0
        
        loginGuideLabel.textColor = .black
        loginGuideLabel.font = ExpenseTracker.Fonts.sfProDisplaySemibold(size: 12)
        loginButton.titleLabel?.font = ExpenseTracker.Fonts.sfProDisplayBold(size: 12)
        loginButton.setTitleColor(ExpenseTracker.Colors.teal_2FEBEB, for: .normal)
    }
    
    func setupText() {
        
        usernameErrorLabel.text = ""
        emailErrorLabel.text = ""
        passwordErrorLabel.text = "​"
        confirmPasswordErrorLabel.text = "​"
        
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 15)
        ])
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 15)
        ])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 15)
        ])
        
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: ExpenseTracker.Fonts.sfProDisplayMedium(size: 15)
        ])
        
        loginButton.setTitleWithoutAnimation("LOGIN", for: .normal)
        signUpButton.setTitleWithoutAnimation("SIGN UP", for: .normal)
        
        loginGuideLabel.text = "Existing User ? Click here to"
    }
}

//MARK: - <SignUpViewType>
extension SignUpViewController: SignUpViewType {
    func signUp() {
        print("giap check signup")
    }
    
    func routeToLogin() {
        print("giap check route to Login")
        
        let screen = DI.container.resolve(LoginViewControllerType.self)!
//        self.navigationController?.pushViewController(screen)
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
    
    func updateHintContainer(textFieldType: ExpenseTracker.Enum.EnumTextFieldPurposeType, message: String) {
        switch textFieldType {
        case .username:
            self.usernameErrorLabel.text = message
        case .email:
            self.emailErrorLabel.text = message
        case .password:
            self.passwordErrorLabel.text = message
        case .password2:
            self.confirmPasswordErrorLabel.text = message
        default:
            break
        }
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
    
    func toggleConfirmShowHidePassword() {
        viewModel.showConfirmPassword.accept(!viewModel.showConfirmPassword.value)
        confirmPasswordTextField.isSecureTextEntry = !viewModel.showConfirmPassword.value
        if viewModel.showConfirmPassword.value {
            showConfirmHidePasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            showConfirmHidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        var maxLength: Int = 18
        if textField == passwordTextField {
            maxLength = 20
        } else {
            maxLength = 18
        }
        if textField != emailTextField {
            
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
        }
        return true
    }
}
