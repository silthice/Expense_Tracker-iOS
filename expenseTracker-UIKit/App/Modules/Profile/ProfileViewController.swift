//
//  ProfileViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxBiBinding

class ProfileViewController: BaseViewController<ProfileViewModel> {
    //MARK: - IBOutlets
    //MARK: - Constants
    //MARK: - Vars
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(ProfileViewModel.self)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    }
    
    override func subscribe() {
        super.subscribe()
        
        disposeBag.insert(
        )
    }
}


//MARK: - Helper
extension ProfileViewController {
    func setupUI() {
        self.view.backgroundColor = .red
    }
    
    func setupText() {
    }
}

//MARK: - <ProfileViewType>
extension ProfileViewController: ProfileViewType {
    
}
