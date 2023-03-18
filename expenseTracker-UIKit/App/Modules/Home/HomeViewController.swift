//
//  HomeViewController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxBiBinding

class HomeViewController: BaseViewController<HomeViewModel> {
    //MARK: - IBOutlets
    //MARK: - Constants
    //MARK: - Vars
    
    //MARK: - Lifecycles
    override func loadView() {
        super.loadView()
        viewModel = DI.resolver.resolve(HomeViewModel.self)!
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
extension HomeViewController {
    func setupUI() {
        self.view.backgroundColor = .lightGray
    }
    
    func setupText() {
    }
}

//MARK: - <HomeViewType>
extension HomeViewController: HomeViewType {
    
}
