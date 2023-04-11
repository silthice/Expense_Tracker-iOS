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
    //MARK: - Constant
    //MARK: - Dependency
    //MARK: - Init
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.tintColor = ExpenseTracker.Colors.teal_2FEBEB
        
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
        let item1 = self.createHomeScreen()
        let icon1 = UITabBarItem(
            title: "",
            image: UIImage(systemName: "homekit"),
            tag: 0
        )
        item1.tabBarItem = icon1
        
        let item2 = self.createProfileScreen()
        let icon2 = UITabBarItem(
            title: "",
            image: UIImage(systemName: "gearshape"),
            tag: 1
        )
        item2.tabBarItem = icon2
        
        let item3 = self.createProfileScreen()
        let icon3 = UITabBarItem(
            title: "",
            image: UIImage(systemName: "gearshape"),
            tag: 1
        )
        item3.tabBarItem = icon3
        
        self.viewControllers = [item1, item2]
        
        viewOverTabBar = UIView(frame: CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: self.tabBar.frame.height))
        viewOverTabBar.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewOverTabBar.backgroundColor = .none
        
        
        //add horizontal stack view into the viewOverTabBar
        let horizontalStackView = UIStackView()
        horizontalStackView.widthAnchor.constraint(equalToConstant: self.tabBar.frame.width).isActive = true
        horizontalStackView.heightAnchor.constraint(equalToConstant: self.tabBar.frame.height).isActive = true
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.backgroundColor = .none
        horizontalStackView.spacing = 0
        
        
        if self.viewControllers?.count ?? 0 > 0 {
            for i in 0...self.viewControllers!.count - 1 {
                horizontalStackView.addArrangedSubview(self.setupTabsGesture(index: i, selected: i == selectedIndex ? true : false))
            }
            viewOverTabBar.addSubview(horizontalStackView)
            //autolayout constraints
            horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
            horizontalStackView.spacing = UIScreen.main.bounds.size.width / 9
            tabBar.addSubview(viewOverTabBar)
            self.selectedIndex = selectedIndex
            tabBarController?.tabBarItem.isEnabled = false
            
        }
        
//        self.tabBar.addSubview(viewOverTabBar)

        addButton()
       
    }
    
    func setupTabsGesture(index: Int, selected: Bool) -> UIView {
        
        let touchableOpacity = UIView(frame: CGRect(x: 0, y: -10, width: 60, height: 60))
        touchableOpacity.backgroundColor = .none
        touchableOpacity.layer.cornerRadius = 15
        touchableOpacity.clipsToBounds = true
        touchableOpacity.tag = index
        
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.iconImageTapped(gesture:)))

        // make sure imageView can be interacted with by user
        touchableOpacity.isUserInteractionEnabled = true
        // add it to the image view;
        touchableOpacity.addGestureRecognizer(tapGesture)
        
        return touchableOpacity
        
    }
    
    @objc func iconImageTapped(gesture: UIGestureRecognizer) {
        print("giap check", gesture.view!.tag)
        self.setupTabBarView(selectedIndex: gesture.view!.tag)
        self.selectedIndex = gesture.view!.tag
    }
    
    func addButton() {
        
//         Add a centered round button
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = ExpenseTracker.Colors.teal_2FEBEB
        button.tintColor = .white
        button.layer.cornerRadius = 27.5
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.viewOverTabBar.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.viewOverTabBar.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.viewOverTabBar.topAnchor),
            button.widthAnchor.constraint(equalToConstant: 55.0),
            button.heightAnchor.constraint(equalToConstant: 55.0)
        ])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("giap pressed")
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
