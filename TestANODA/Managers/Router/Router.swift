//
//  Router.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import Foundation
import UIKit

// MARK: - Router protocol

protocol RouterProtocol {
    
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
    func loadViewController()
    func homeViewController()
    
}

// MARK: - Router

class Router: RouterProtocol {
    
    // MARK: - Variables
    
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    var tabBarController: UITabBarController?
    
    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    // MARK: - Router methods
    
    func loadViewController() {
        if let navigationController = navigationController {
            guard let loadViewController = builder?.createLoadModule(router: self) else { return }
            navigationController.viewControllers = [loadViewController]
        }
    }
    
    func homeViewController() {
        if let navigationController = navigationController {
            guard let homeViewController = builder?.createHomeModule(router: self) else { return }
            guard let searchViewController = builder?.createSearchModule(router: self) else { return }
            guard let newPublicationViewController = builder?.createNewPublicationModule(router: self) else { return }
            guard let actionsViewController = builder?.createActionsModule(router: self) else { return }
            homeViewController.tabBarItem.image = UIImage(named: "ic_home")
            homeViewController.tabBarItem.selectedImage = UIImage(named: "ic_home_selected")
            searchViewController.tabBarItem.image = UIImage(named: "ic_search")
            searchViewController.tabBarItem.selectedImage = UIImage(named: "ic_search_selected")
            newPublicationViewController.tabBarItem.image = UIImage(named: "ic_new_publication")
            newPublicationViewController.tabBarItem.selectedImage = UIImage(named: "ic_new_publication_selected")
            actionsViewController.tabBarItem.image = UIImage(named: "ic_actions")
            actionsViewController.tabBarItem.selectedImage = UIImage(named: "ic_actions_selected")
            let homeNavigationController = UINavigationController(rootViewController: homeViewController)
            let searchNavigationController = UINavigationController(rootViewController: searchViewController)
            let newPublicationNavigationController = UINavigationController(rootViewController: newPublicationViewController)
            let actionsNavigationController = UINavigationController(rootViewController: actionsViewController)
            tabBarController = UITabBarController()
            tabBarController?.setViewControllers([homeNavigationController, searchNavigationController, newPublicationNavigationController, actionsNavigationController], animated: false)
            tabBarController?.modalPresentationStyle = .fullScreen
            tabBarController?.tabBar.frame.size.height = 50
            tabBarController?.tabBar.barTintColor = UIColor(red: 219 / 255, green: 219 / 255, blue: 219 / 255, alpha: 1)
            tabBarController?.tabBar.tintColor = .black
            tabBarController?.tabBar.unselectedItemTintColor = .black
            navigationController.present(tabBarController ?? UITabBarController(), animated: false, completion: nil)
        }
    }
    
}
