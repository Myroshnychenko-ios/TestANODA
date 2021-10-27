//
//  LoadVC + Configure.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 19.10.2021.
//

import UIKit

extension LoadViewController {
    
    // MARK: - Configure LoadViewController
    
    func configure() {
        configureView()
        configureBackgroundImageView()
        configureContentView()
        configureLogoImageView()
        configureNameImageView()
        configureJoinNowButton()
    }
    
    private func configureView() {
        view.backgroundColor = .white
    }
    
    private func configureBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        })
        backgroundImageView.image = UIImage(named: "im_background")
        backgroundImageView.contentMode = .scaleAspectFill
    }
    
    private func configureContentView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        })
        contentView.backgroundColor = .clear
    }
    
    private func configureLogoImageView() {
        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
        })
        logoImageView.image = UIImage(named: "im_logo")
    }
    
    private func configureNameImageView() {
        contentView.addSubview(nameImageView)
        nameImageView.snp.makeConstraints({ make in
            make.top.equalTo(logoImageView.snp_bottomMargin).inset(-20)
            make.bottom.equalToSuperview()
            make.height.equalTo(85)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
        })
        nameImageView.image = UIImage(named: "im_name")
    }
    
    private func configureJoinNowButton() {
        view.addSubview(joinNowButton)
        joinNowButton.snp.makeConstraints({ make in
            make.top.equalTo(contentView.snp_bottomMargin).inset(-50)
            make.height.equalTo(35)
            make.width.equalTo(120)
            make.centerX.equalToSuperview()
        })
        joinNowButton.setBackgroundImage(UIImage(named: "btn_join_now"), for: .normal)
        joinNowButton.addTarget(self, action: #selector(joinNowButtonTapped), for: .touchUpInside)
    }
    
}
