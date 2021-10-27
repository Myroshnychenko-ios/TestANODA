//
//  PublicationCVCell + Configure.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 21.10.2021.
//

import Foundation
import UIKit

extension PublicationCollectionViewCell {
    
    // MARK: - Configure CollectionViewCell
    
    func configure() {
        for view in contentView.subviews{
            view.removeFromSuperview()
        }
        configureContentView()
        configureProfilePhotoButton()
        configureProfileNameButton()
        configureLocationButton()
        configureScrollView()
        configureRatePublicationButton()
        configureCommentsButton()
        configureSharePublicationButton()
        configurePageControl()
        configureFavoritesPublicationButton()
        configureRatePublicationCounterButton()
        configureTitlePublicationLabel()
        configureCommentsCountButton()
    }
    
    private func configureContentView() {
        contentView.backgroundColor = .clear
    }
    
    private func configureProfilePhotoButton() {
        profilePhotoButton = UIButton()
        contentView.addSubview(profilePhotoButton)
        profilePhotoButton.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(45)
            make.width.equalTo(45)
        })
        profilePhotoButton.clipsToBounds = true
        profilePhotoButton.layer.cornerRadius = 22.5
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.gray.cgColor
        profilePhotoButton.addTarget(self, action: #selector(profilePhotoButtonTapped), for: .touchUpInside)
        guard dataLoader != nil else { return }
        dataLoader?.loadImage(urlString: publicationData?.userPhoto ?? "error", completion: { [weak self] image in
            guard self != nil else { return }
            DispatchQueue.main.async {
                self?.profilePhotoButton.setBackgroundImage(image, for: .normal)
            }
        })
    }
    
    private func configureProfileNameButton() {
        profileNameButton = UIButton()
        contentView.addSubview(profileNameButton)
        profileNameButton.snp.makeConstraints({ make in
            if publicationData?.location != nil {
                make.top.equalToSuperview().inset(20)
            } else {
                make.top.equalToSuperview().inset(32.5)
            }
            make.left.equalTo(profilePhotoButton.snp.right).inset(-10)
            make.height.equalTo(20)
        })
        let userName = publicationData?.userName ?? "error.error"
        profileNameButton.setTitle(userName, for: .normal)
        profileNameButton.setTitleColor(.black, for: .normal)
        profileNameButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        profileNameButton.addTarget(self, action: #selector(profileNameButtonTapped), for: .touchUpInside)
    }
    
    private func configureLocationButton() {
        guard publicationData?.location != nil else { return }
        locationButton = UIButton()
        contentView.addSubview(locationButton)
        locationButton.snp.makeConstraints({ make in
            make.top.equalTo(profileNameButton.snp.bottom).inset(-5)
            make.left.equalTo(profilePhotoButton.snp.right).inset(-10)
            make.height.equalTo(20)
        })
        let location = publicationData?.location ?? "error"
        locationButton.setTitle(location, for: .normal)
        locationButton.setTitleColor(.black, for: .normal)
        locationButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        locationButton.setImage(UIImage(named: "ic_arrow"), for: .normal)
        locationButton.semanticContentAttribute = .forceRightToLeft
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
    }
    
    private func configureScrollView() {
        scrollView = UIScrollView()
        contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints({ make in
            make.top.equalTo(profilePhotoButton.snp.bottom).inset(-20)
            make.left.equalToSuperview()
            make.width.equalTo(contentView.frame.size.width)
            make.height.equalTo(contentView.frame.size.width)
        })
        scrollView.backgroundColor = .clear
        scrollView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.width)
        guard let imagesCount = publicationData?.publicationImages.count else { return }
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        for index in 0..<imagesCount {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            let imageView = UIImageView(frame: frame)
            dataLoader?.loadImage(urlString: publicationData?.publicationImages[index] ?? "error", completion: { [weak self] image in
                guard self != nil else { return }
                DispatchQueue.main.async {
                    imageView.image = image
                    self?.scrollView.addSubview(imageView)
                }
            })
        }
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(imagesCount), height: contentView.frame.size.width)
        scrollView.delegate = self
    }
    
    private func configureRatePublicationButton() {
        ratePublicationButton = UIButton()
        contentView.addSubview(ratePublicationButton)
        ratePublicationButton.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.bottom).inset(-20)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        })
        let isRate = publicationData?.isRate ?? false
        if isRate {
            ratePublicationButton.setImage(UIImage(named: "ic_rate_publication_off"), for: .normal)
        } else {
            ratePublicationButton.setImage(UIImage(named: "ic_rate_publication_on"), for: .normal)
        }
        ratePublicationButton.addTarget(self, action: #selector(ratePublicationButtonTapped), for: .touchUpInside)
    }
    
    private func configureCommentsButton() {
        commentsButton = UIButton()
        contentView.addSubview(commentsButton)
        commentsButton.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.bottom).inset(-20)
            make.left.equalTo(ratePublicationButton.snp.right).inset(-20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        })
        commentsButton.setImage(UIImage(named: "ic_comments"), for: .normal)
        commentsButton.addTarget(self, action: #selector(commentsButtonTapped), for: .touchUpInside)
    }
    
    private func configureSharePublicationButton() {
        sharePublicationButton = UIButton()
        contentView.addSubview(sharePublicationButton)
        sharePublicationButton.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.bottom).inset(-20)
            make.left.equalTo(commentsButton.snp.right).inset(-20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        })
        sharePublicationButton.setImage(UIImage(named: "ic_share_publication"), for: .normal)
        sharePublicationButton.addTarget(self, action: #selector(sharePublicationButtonTapped), for: .touchUpInside)
    }
    
    private func configurePageControl() {
        guard let imagesCount = publicationData?.publicationImages.count else { return }
        guard imagesCount > 1 else { return }
        pageControl = UIPageControl()
        contentView.addSubview(pageControl)
        pageControl.snp.makeConstraints({ make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(sharePublicationButton.snp.centerY)
        })
        pageControl.numberOfPages = imagesCount
        pageControl.tintColor = .clear
        pageControl.pageIndicatorTintColor = UIColor(red: 142 / 255, green: 142 / 255, blue: 142 / 255, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 20 / 255, green: 54 / 255, blue: 103 / 255, alpha: 1)
    }
    
    private func configureFavoritesPublicationButton() {
        favoritesPublicationButton = UIButton()
        contentView.addSubview(favoritesPublicationButton)
        favoritesPublicationButton.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.bottom).inset(-20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        })
        let isFavorites = publicationData?.isFavorites ?? false
        if isFavorites {
            favoritesPublicationButton.setImage(UIImage(named: "ic_favorites_publication_off"), for: .normal)
        } else {
            favoritesPublicationButton.setImage(UIImage(named: "ic_favorites_publication_on"), for: .normal)
        }
        favoritesPublicationButton.addTarget(self, action: #selector(favoritesPublicationButtonTapped), for: .touchUpInside)
    }
    
    private func configureRatePublicationCounterButton() {
        ratePublicationCounterButton = UIButton()
        contentView.addSubview(ratePublicationCounterButton)
        ratePublicationCounterButton.snp.makeConstraints({ make in
            make.top.equalTo(ratePublicationButton.snp.bottom).inset(-20)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(20)
        })
        let rateCount = publicationData?.likes ?? 0
        ratePublicationCounterButton.setTitle("\(rateCount) отметок \"Нравиться\"", for: .normal)
        ratePublicationCounterButton.setTitleColor(.black, for: .normal)
        ratePublicationCounterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        ratePublicationCounterButton.addTarget(self, action: #selector(ratePublicationCounterButtonTapped), for: .touchUpInside)
    }
    
    private func configureTitlePublicationLabel() {
        guard let title = publicationData?.publicationTitle else { return }
        guard title.count != 0 else { return }
        titlePublicationLabel = UILabel()
        contentView.addSubview(titlePublicationLabel)
        titlePublicationLabel.snp.makeConstraints({ make in
            make.top.equalTo(ratePublicationCounterButton.snp.bottom).inset(-20)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        })
        var textArray = [String]()
        var fontArray = [UIFont]()
        var colorArray = [UIColor]()
        if getFullTitleText().count > 80 {
            textArray.append(publicationData?.userName ?? "error")
            if title.count > 50 {
                textArray.append(String(title.prefix(50)))
            } else {
                textArray.append(title)
            }
            textArray.append(" ... ещё")
            fontArray.append(UIFont.boldSystemFont(ofSize: 15))
            fontArray.append(UIFont.systemFont(ofSize: 15))
            fontArray.append(UIFont.systemFont(ofSize: 15))
            colorArray.append(.black)
            colorArray.append(.black)
            colorArray.append(UIColor(red: 142 / 255, green: 142 / 255, blue: 142 / 255, alpha: 1))
        } else {
            textArray.append(publicationData?.userName ?? "error")
            textArray.append(title)
            fontArray.append(UIFont.boldSystemFont(ofSize: 15))
            fontArray.append(UIFont.systemFont(ofSize: 15))
            colorArray.append(.black)
            colorArray.append(.black)
            guard let hashtags = publicationData?.hashtags else { return }
            if !hashtags.isEmpty {
                for hashtag in hashtags {
                    textArray.append(hashtag)
                    fontArray.append(UIFont.systemFont(ofSize: 15))
                    colorArray.append(UIColor(red: 20 / 255, green: 54 / 255, blue: 103 / 255, alpha: 1))
                }
            }
        }
        titlePublicationLabel.attributedText = getAttributedString(textArray: textArray, fontArray: fontArray, colorArray: colorArray)
        titlePublicationLabel.isUserInteractionEnabled = true
        titlePublicationLabel.numberOfLines = 0
        let tappGesture = UITapGestureRecognizer(target: self, action: #selector(titlePublicationLabelTapped(_ :)))
        tappGesture.numberOfTapsRequired = 1
        self.titlePublicationLabel.addGestureRecognizer(tappGesture)
    }
    
    private func configureCommentsCountButton() {
        guard let comments = publicationData?.commentsCount else { return }
        guard comments != 0 else { return }
        commentsButton = UIButton()
        contentView.addSubview(commentsButton)
        if publicationData?.publicationTitle != nil {
            commentsButton.snp.makeConstraints({ make in
                make.top.equalTo(titlePublicationLabel.snp.bottom).inset(-5)
                make.left.equalToSuperview().inset(20)
                make.height.equalTo(20)
            })
        } else {
            commentsButton.snp.makeConstraints({ make in
                make.top.equalTo(ratePublicationCounterButton.snp.bottom).inset(-5)
                make.left.equalToSuperview().inset(20)
                make.height.equalTo(20)
            })
        }
        commentsButton.setTitle("Посмотреть все коментарии (\(comments))", for: .normal)
        commentsButton.setTitleColor(UIColor(red: 142 / 255, green: 142 / 255, blue: 142 / 255, alpha: 1), for: .normal)
        commentsButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        commentsButton.addTarget(self, action: #selector(allCommentsButtonTapped), for: .touchUpInside)
    }
    
}
