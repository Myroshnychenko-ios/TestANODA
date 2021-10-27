//
//  HomeViewController.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    
    var presenter: HomePresenterProtocol?
    var collectionView: UICollectionView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter?.fetchData()
    }
    
}
