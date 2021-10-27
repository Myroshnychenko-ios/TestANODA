//
//  LoadPresenter.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import Foundation

// MARK: - View protocol

protocol LoadViewProtocol: AnyObject {
    
}

// MARK: - Presenter protocol

protocol LoadPresenterProtocol: AnyObject {
    
    init(view: LoadViewProtocol, router: RouterProtocol)
    func pushHomeViewController()
    
}

// MARK: - Presenter

class LoadPresenter: LoadPresenterProtocol {
    
    // MARK: - Variables
    
    weak var view: LoadViewProtocol?
    var router: RouterProtocol?
    
    // MARK: - Lifecycle
    
    required init(view: LoadViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Protocol methods
    
    func pushHomeViewController() {
        router?.homeViewController()
    }
    
}
