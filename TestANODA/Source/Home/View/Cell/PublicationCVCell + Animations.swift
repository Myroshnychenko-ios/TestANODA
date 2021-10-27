//
//  PublicationCVCell + Animations.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 24.10.2021.
//

import Foundation
import UIKit

extension PublicationCollectionViewCell {
    
    // MARK: - Animations
    
    func animateRatePiblicationButton() {
        scaleRateBublicationButton()
    }
    
    // MARK: Scale rate publication button
    
    private func scaleRateBublicationButton() {
        UIView.animate(withDuration: 0.15) {
            self.ratePublicationButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            self.ratePublicationButton.transform = .identity
        }
    }
    
}
