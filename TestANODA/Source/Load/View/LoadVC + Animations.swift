//
//  LoadVC + Animations.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import Foundation
import UIKit

extension LoadViewController {
    
    // MARK: - Animations
    
    func animateJoinNowButton() {
        animateJoinNowButtonTransform()
    }
    
    // MARK: - Join now button animate
    
    private func animateJoinNowButtonTransform() {
        joinNowButton.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.3) {
            self.joinNowButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            self.animateJoinNowButtonIdentity()
        }
    }
    
    private func animateJoinNowButtonIdentity() {
        UIView.animate(withDuration: 0.2) {
            self.joinNowButton.transform = .identity
        }
    }
    
}
