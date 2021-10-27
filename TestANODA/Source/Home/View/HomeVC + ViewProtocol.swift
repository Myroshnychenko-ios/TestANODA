//
//  HomeVC + ViewProtocol.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import Foundation
import UIKit

extension HomeViewController: HomeViewProtocol {
    
    // MARK: - HomeViewProtocol methods
    
    func success() {
        collectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error)
    }
    
}
