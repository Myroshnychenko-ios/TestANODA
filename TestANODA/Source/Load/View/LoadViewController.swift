//
//  LoadViewController.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import UIKit
import SnapKit

class LoadViewController: UIViewController {
    
    // MARK: - Variables
    
    var presenter: LoadPresenterProtocol?
    var backgroundImageView = UIImageView()
    var contentView = UIView()
    var logoImageView = UIImageView()
    var nameImageView = UIImageView()
    var joinNowButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        configure()
        animateJoinNowButton()
    }
    
    // MARK: - Actions
    
    @objc func joinNowButtonTapped(sender: UIButton?) {
        presenter?.pushHomeViewController()
    }
    
}
