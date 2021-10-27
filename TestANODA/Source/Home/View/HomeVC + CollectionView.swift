//
//  HomeVC + CollectionView.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 20.10.2021.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - CollectionView DG/DS/DFL
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.publicationData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PublicationCollectionViewCell.identifier, for: indexPath) as! PublicationCollectionViewCell
        cell.viewController = self
        cell.dataLoader = DataLoader()
        if let data = presenter?.publicationData?[indexPath.row] {
            cell.publicationData = data
        }
        cell.configure()
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 730)
    }
    
}
