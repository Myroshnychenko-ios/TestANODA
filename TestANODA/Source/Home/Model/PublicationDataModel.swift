//
//  PublicationDataModel.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 25.10.2021.
//

import Foundation

// MARK: - Publication data model

struct PublicationData: Codable {
    
    var userID: Int
    var userName: String
    var userPhoto: String
    var location: String?
    var publicationImages: [String]
    var isRate: Bool
    var isFavorites: Bool
    var likes: Int
    var publicationTitle: String?
    var hashtags: [String]?
    var commentsCount: Int?
    
}
