//
//  PublicationCollectionViewCell.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 20.10.2021.
//

import UIKit

class PublicationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    static let identifier = "PublicationCollectionViewCell"
    weak var viewController: UIViewController?
    var dataLoader: DataLoader?
    var publicationData: PublicationData?
    var profilePhotoButton: UIButton!
    var profileNameButton: UIButton!
    var locationButton: UIButton!
    var scrollView: UIScrollView!
    var ratePublicationButton: UIButton!
    var commentsButton: UIButton!
    var sharePublicationButton: UIButton!
    var pageControl: UIPageControl!
    var favoritesPublicationButton: UIButton!
    var ratePublicationCounterButton: UIButton!
    var titlePublicationLabel: UILabel!
    var commentsCountButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Actions
    
    @objc func profilePhotoButtonTapped(sender: UIButton?) {
        showAlert(title: publicationData?.userName ?? "error", messgae: "Show user ViewController")
    }
    
    @objc func profileNameButtonTapped(sender: UIButton?) {
        showAlert(title: publicationData?.userName ?? "error", messgae: "Show user ViewController")
    }
    
    @objc func locationButtonTapped(sender: UIButton?) {
        showAlert(title: publicationData?.location ?? "error", messgae: "Show location ViewController")
    }
    
    @objc func ratePublicationButtonTapped(sender: UIButton?) {
        guard var rateStatus = publicationData?.isRate else { return }
        var likes = publicationData?.likes ?? 0
        rateStatus = !rateStatus
        if rateStatus {
            ratePublicationButton.setImage(UIImage(named: "ic_rate_publication_off"), for: .normal)
            likes += 1
            animateRatePiblicationButton()
        } else {
            ratePublicationButton.setImage(UIImage(named: "ic_rate_publication_on"), for: .normal)
            likes -= 1
        }
        publicationData?.isRate = rateStatus
        publicationData?.likes = likes
        ratePublicationCounterButton.setTitle("\(likes) отметок \"Нравиться\"", for: .normal)
    }
    
    @objc func commentsButtonTapped(sender: UIButton?) {
        showAlert(title: "Set comment", messgae: "Show comments ViewController")
    }
    
    @objc func sharePublicationButtonTapped(sender: UIButton?) {
        showAlert(title: "Share publication", messgae: "Show followers ViewController")
    }
    
    @objc func favoritesPublicationButtonTapped(sender: UIButton?) {
        guard var favoritesStatus = publicationData?.isFavorites else { return }
        favoritesStatus = !favoritesStatus
        if favoritesStatus {
            favoritesPublicationButton.setImage(UIImage(named: "ic_favorites_publication_off"), for: .normal)
        } else {
            favoritesPublicationButton.setImage(UIImage(named: "ic_favorites_publication_on"), for: .normal)
        }
        publicationData?.isFavorites = favoritesStatus
    }
    
    @objc func ratePublicationCounterButtonTapped(sender: UIButton?) {
        showAlert(title: "Who like", messgae: "Show followers who like ViewController")
    }
    
    @objc func titlePublicationLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let title = publicationData?.publicationTitle else { return }
        guard title.count != 0 else { return }
        guard let text = titlePublicationLabel.text else { return }
        let userNameRange = (text as NSString).range(of: publicationData?.userName ?? "error")
        let yetRange = (text as NSString).range(of: " ... ещё")
        if gesture.didTapAttributedTextInLabel(label: titlePublicationLabel, inRange: userNameRange) {
            showAlert(title: publicationData?.userName ?? "error", messgae: "Show user ViewController")
        }
        guard let hashtags = publicationData?.hashtags else { return }
        if gesture.didTapAttributedTextInLabel(label: titlePublicationLabel, inRange: yetRange) {
            var textArray = [String]()
            var fontArray = [UIFont]()
            var colorArray = [UIColor]()
            textArray.append(publicationData?.userName ?? "error")
            textArray.append(title)
            fontArray.append(UIFont.boldSystemFont(ofSize: 15))
            fontArray.append(UIFont.systemFont(ofSize: 15))
            colorArray.append(.black)
            colorArray.append(.black)
            if !hashtags.isEmpty {
                for hashtag in hashtags {
                    textArray.append(hashtag)
                    fontArray.append(UIFont.systemFont(ofSize: 15))
                    colorArray.append(UIColor(red: 20 / 255, green: 54 / 255, blue: 103 / 255, alpha: 1))
                }
            }
            titlePublicationLabel.attributedText = NSMutableAttributedString()
            titlePublicationLabel.attributedText = getAttributedString(textArray: textArray, fontArray: fontArray, colorArray: colorArray)
        }
        if !hashtags.isEmpty {
            for hashtag in hashtags {
                let hashtagRange = (text as NSString).range(of: hashtag)
                if gesture.didTapAttributedTextInLabel(label: titlePublicationLabel, inRange: hashtagRange) {
                    showAlert(title: "\(hashtag)", messgae: "Show current hashtag ViewController")
                }
            }
        }
    }
    
    @objc func allCommentsButtonTapped(sender: UIButton?) {
        showAlert(title: "Comments \(publicationData?.commentsCount ?? 0)", messgae: "Show comments ViewController")
    }
    
    // MARK: - Helpers
    
    func getAttributedString(textArray:[String]?, fontArray:[UIFont]? , colorArray:[UIColor]?) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString()
        for i in 0 ..< (textArray?.count)! {
            let attributes = [NSAttributedString.Key.foregroundColor: colorArray?[i], NSAttributedString.Key.font: fontArray?[i]]
            let attributedString = (NSAttributedString.init(string: textArray?[i] ?? "", attributes: attributes as [NSAttributedString.Key : Any]))
            if i != 0 {
                mutableAttributedString.append(NSAttributedString.init(string: " "))
            }
            mutableAttributedString.append(attributedString)
        }
        return mutableAttributedString
    }
    
    func getFullTitleText() -> String {
        guard let title = publicationData?.publicationTitle else { return "" }
        guard title.count != 0 else { return "" }
        guard let hashtags = publicationData?.hashtags else { return "" }
        var fullText = String()
        fullText = (publicationData?.userName ?? "error") + title
        if !hashtags.isEmpty {
            fullText += " "
            for hashtag in hashtags {
                fullText += hashtag
                if hashtag != hashtags.last {
                    fullText += " "
                }
            }
        }
        print(fullText.count)
        return fullText
    }
    
    func showAlert(title: String, messgae: String) {
        guard viewController != nil else { return }
        let alertController = UIAlertController(title: title, message: messgae, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
}
