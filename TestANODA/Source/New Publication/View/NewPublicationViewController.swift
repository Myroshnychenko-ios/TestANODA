//
//  NewPublicationViewController.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import UIKit

class NewPublicationViewController: UIViewController {

    // MARK: - Variables
    
    var presenter: NewPublicationPresenterProtocol?
    var contentView: UIView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}
