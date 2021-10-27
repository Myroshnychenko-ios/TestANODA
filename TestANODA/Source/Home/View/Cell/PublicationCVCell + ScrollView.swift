//
//  PublicationCVCell + ScrollView.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 22.10.2021.
//

import Foundation
import UIKit

extension PublicationCollectionViewCell: UIScrollViewDelegate {
    
    // MARK: - ScrollView DG
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        self.pageControl.currentPage = Int(page)
    }
    
}
