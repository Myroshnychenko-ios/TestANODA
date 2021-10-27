//
//  ActionsViewController.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import UIKit

class ActionsViewController: UIViewController {

    // MARK: - Variables
    
    var presenter: ActionsPresenterProtocol?
    var contentView: UIView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}
