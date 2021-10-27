//
//  SearchPresenter.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import Foundation

// MARK: - View protocol

protocol SearchViewProtocol: AnyObject {
    
}

// MARK: - Presenter protocol

protocol SearchPresenterProtocol: AnyObject {
    
    init(view: SearchViewProtocol)
    
}

// MARK: - Presenter

class SearchPresenter: SearchPresenterProtocol {
    
    // MARK: - Variables
    
    weak var view: SearchViewProtocol?
    
    // MARK: - Lifecycle
    
    required init(view: SearchViewProtocol) {
        self.view = view
    }
    
}
