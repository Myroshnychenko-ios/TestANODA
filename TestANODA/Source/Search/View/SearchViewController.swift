//
//  SearchViewController.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Variables
    
    var presenter: SearchPresenterProtocol?
    var contentView: UIView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}
