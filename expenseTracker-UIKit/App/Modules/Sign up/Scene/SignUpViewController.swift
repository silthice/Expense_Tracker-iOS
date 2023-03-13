//
//  SignUpViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: BaseViewController<SignUpViewModel> {
    //MARK: - IBOutlets
    //MARK: - Constants
    //MARK: - Vars
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(SignUpViewModel.self)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: animated)
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
extension SignUpViewController {
    func setupUI() {
        
    }
    
    func setupText() {
        
    }
}

//MARK: - <SignUpViewType>
extension SignUpViewController: SignUpViewType {
    
}
