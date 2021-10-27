//
//  Builder.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import Foundation
import UIKit

// MARK: - Module builder protocol

protocol BuilderProtocol {
    
    func createLoadModule(router: RouterProtocol) -> UIViewController
    func createHomeModule(router: RouterProtocol) -> UIViewController
    func createSearchModule(router: RouterProtocol) -> UIViewController
    func createNewPublicationModule(router: RouterProtocol) -> UIViewController
    func createActionsModule(router: RouterProtocol) -> UIViewController
    
}

// MARK: - Module builder

class Builder: BuilderProtocol {
    
    // MARK: - Builder methods
    
    func createLoadModule(router: RouterProtocol) -> UIViewController {
        let view = LoadViewController()
        let presenter = LoadPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createHomeModule(router: RouterProtocol) -> UIViewController {
        let view = HomeViewController()
        let dataLoader = DataLoader()
        let presenter = HomePresenter(view: view, router: router, dataLoader: dataLoader)
        view.presenter = presenter
        return view
    }
    
    func createSearchModule(router: RouterProtocol) -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func createNewPublicationModule(router: RouterProtocol) -> UIViewController {
        let view = NewPublicationViewController()
        let presenter = NewPublicationPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func createActionsModule(router: RouterProtocol) -> UIViewController {
        let view = ActionsViewController()
        let presenter = ActionsPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
}
