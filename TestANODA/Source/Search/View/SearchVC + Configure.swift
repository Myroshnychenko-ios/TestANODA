//
//  SearchVC + Configure.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import Foundation
import UIKit

extension SearchViewController {
    
    // MARK: - Configure SearchViewController
    
    func configure() {
        configureView()
        configureNavigationController()
        configureContentView()
    }
    
    private func configureView() {
        view.backgroundColor = UIColor(red: 219 / 255, green: 219 / 255, blue: 219 / 255, alpha: 1)
    }
    
    private func configureNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = UIColor(red: 219 / 255, green: 219 / 255, blue: 219 / 255, alpha: 1)
        navigationController?.navigationBar.tintColor = .black
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Поиск"
        navigationItem.titleView = searchBar
    }
    
    private func configureContentView() {
        contentView = UIView()
        view.addSubview(contentView)
        contentView.snp.makeConstraints({ make in
            make.top.equalTo(view.snp.topMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(view.snp_bottomMargin)
        })
        contentView.backgroundColor = .white
    }
    
}
