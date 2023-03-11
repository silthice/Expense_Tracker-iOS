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
    //MARK: - Constants
    //MARK: - Vars
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(LoginViewModel.self)!
    }
    
    override func setupView() {
        super.setupView()
        view.backgroundColor = .red
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
    
}

//MARK: - <LoginViewType>
extension LoginViewController: LoginViewType {
    
}
