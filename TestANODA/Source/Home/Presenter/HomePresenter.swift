//
//  HomePresenter.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import Foundation

// MARK: - View protocol

protocol HomeViewProtocol: AnyObject {
    
    func success()
    func failure(error: Error)
    
}

// MARK: - Presenter protocol

protocol HomePresenterProtocol: AnyObject {
    
    var publicationData: [PublicationData]? { get set }
    
    init(view: HomeViewProtocol, router: RouterProtocol, dataLoader: DataLoader)
    func fetchData()
    
}

// MARK: - Presenter

class HomePresenter: HomePresenterProtocol {
    
    // MARK: - Variables
    
    weak var view: HomeViewProtocol?
    var router: RouterProtocol?
    var dataLoader: DataLoader?
    var publicationData: [PublicationData]?
    
    // MARK: - Lifecycle
    
    required init(view: HomeViewProtocol, router: RouterProtocol, dataLoader: DataLoader) {
        self.view = view
        self.router = router
        self.dataLoader = dataLoader
    }
    
    // MARK: - Protocol methods
    
    func fetchData() {
        dataLoader?.load(completion: { [weak self] result in
            guard self != nil else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let publicationData):
                    self?.publicationData = publicationData
                    self?.view?.success()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        })
    }
    
}
