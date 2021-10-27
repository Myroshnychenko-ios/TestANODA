//
//  ActionsPresenter.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import Foundation

// MARK: - View protocol

protocol ActionsViewProtocol: AnyObject {
    
}

// MARK: - Presenter protocol

protocol ActionsPresenterProtocol: AnyObject {
    
    init(view: ActionsViewProtocol)
    
}

// MARK: - Presenter

class ActionsPresenter: ActionsPresenterProtocol {
    
    // MARK: - Variables
    
    weak var view: ActionsViewProtocol?
    
    // MARK: - Lifecycle
    
    required init(view: ActionsViewProtocol) {
        self.view = view
    }
    
}
