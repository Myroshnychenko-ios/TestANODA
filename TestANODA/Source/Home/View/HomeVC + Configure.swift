//
//  HomeVC + Configure.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 20.10.2021.
//

import Foundation
import UIKit

extension HomeViewController {
    
    // MARK: - Configure HomeViewController
    
    func configure() {
        configureView()
        configureNavigationController()
        configureCollectionView()
    }
    
    private func configureView() {
        view.backgroundColor = UIColor(red: 219 / 255, green: 219 / 255, blue: 219 / 255, alpha: 1)
    }
    
    private func configureNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 219 / 255, green: 219 / 255, blue: 219 / 255, alpha: 1)
        navigationController?.navigationBar.tintColor = .black
        let imageView = UIImageView(image: UIImage(named: "im_name_black"))
        imageView.contentMode = .scaleAspectFill
        navigationItem.titleView = imageView
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_photo"), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_message"), style: .done, target: self, action: nil)
    }
    
    private func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 800)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints({ make in
            make.top.equalTo(view.snp.topMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(view.snp_bottomMargin)
        })
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(PublicationCollectionViewCell.self, forCellWithReuseIdentifier: PublicationCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}
