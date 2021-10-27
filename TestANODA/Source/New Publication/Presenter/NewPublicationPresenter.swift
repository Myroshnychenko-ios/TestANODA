//
//  NewPublicationPresenter.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import Foundation

// MARK: - View protocol

protocol NewPublicationViewProtocol: AnyObject {
    
}

// MARK: - Presenter protocol

protocol NewPublicationPresenterProtocol: AnyObject {
    
    init(view: NewPublicationViewProtocol)
    
}

// MARK: - Presenter

class NewPublicationPresenter: NewPublicationPresenterProtocol {
    
    // MARK: - Variables
    
    weak var view: NewPublicationViewProtocol?
    
    // MARK: - Lifecycle
    
    required init(view: NewPublicationViewProtocol) {
        self.view = view
    }
    
}
