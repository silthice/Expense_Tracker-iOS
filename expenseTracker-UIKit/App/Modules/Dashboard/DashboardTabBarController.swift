//
//  DashboardTabBarController.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 18/03/2023.
//

import UIKit

class DashboardTabBarController: UITabBarController, DashboardTabBarViewType {
    //MARK: - Var
    var dashboardAction: ExpenseTracker.Enum.EnumDashboardAction = .home
    var dashboardActionValue: String = ""
    var viewOverTabBar = UIView()
    private var centerButton: UIButton!
    //MARK: - Constant
    //MARK: - Dependency
    //MARK: - Init
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.tintColor = .white
        
        switch dashboardAction {
        case .profile:
            self.selectedIndex = 1
        default:
            self.selectedIndex = 0
        }
        self.setupTabBarView(selectedIndex: 0)
    }
    
}

extension DashboardTabBarController {
    func setupTabBarView(selectedIndex: Int){
//        tabBar.backgroundColor = .clear
//        tabBarController?.tabBar.backgroundColor = .red
        let item1 = self.createHomeScreen()
        let icon1 = UITabBarItem(
            title: "Home",
//            image: selectedIndex == 0 ? UIImage() : UIImage(systemName: "homekit"),
            image: UIImage(systemName: "homekit"),
            tag: 0
        )
        item1.tabBarItem = icon1
        
        let item2 = self.createProfileScreen()
        let icon2 = UITabBarItem(
            title: "Setting",
            image: UIImage(systemName: "gearshape"),
            tag: 1
        )
        item2.tabBarItem = icon2
        
        self.viewControllers = [item1, item2]
        
        viewOverTabBar = UIView(frame: CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: self.tabBar.frame.height))
        viewOverTabBar.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewOverTabBar.backgroundColor = .clear
        
        // Add a centered round button
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = ExpenseTracker.Colors.teal_2FEBEB
        button.layer.cornerRadius = 27.5
        button.setImage(UIImage(systemName: "homekit"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.insertSubview(button, aboveSubview: self.tabBar)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.tabBar.topAnchor),
            button.widthAnchor.constraint(equalToConstant: 55.0),
            button.heightAnchor.constraint(equalToConstant: 55.0)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("giap pressed")
       }
    
    @objc func centerButtonPressed() {
        print("giap pressed")
        // Handle center button press
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = UIColor.white
//        viewController.modalPresentationStyle = .fullScreen
//
//        if let viewController = self.window?.rootViewController {
//            viewController.present(viewController, animated: true, completion: nil)
//        }
    }
    
    func createHomeScreen() -> UIViewController {
        let screen = DI.resolver.resolve(HomeViewControllerType.self)!
        screen.hidesBottomBarWhenPushed = false
        let nav = UINavigationController(rootViewController: screen)
        return nav
    }

    func createProfileScreen() -> UIViewController {
        let screen = DI.resolver.resolve(ProfileViewControllerType.self)!
        screen.hidesBottomBarWhenPushed = false
        let nav = UINavigationController(rootViewController: screen)
        return nav
    }
}
