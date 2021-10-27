//
//  DataLoader.swift
//  TestANODA
//
//  Created by Максим Мирошниченко on 25.10.2021.
//

import Foundation
import UIKit
import Alamofire

// MARK: - Loader protocol

protocol LoaderProtocol {
    
    func load(completion: @escaping (Result<[PublicationData], Error>) -> Void)
    func loadImage(urlString: String, completion: @escaping (UIImage) -> Void)
    
}

// MARK: - Loader

class DataLoader: LoaderProtocol {
    
    // MARK: - Variables
    
    var publicationData = [PublicationData]()
    
    // MARK: - Loader methods
    
    func load(completion: @escaping (Result<[PublicationData], Error>) -> Void) {
        if let fileLocation = Bundle.main.url(forResource: "Data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([PublicationData].self, from: data)
                publicationData = dataFromJson
                completion(.success(publicationData))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString) else { return }
        AF.download(url).responseData(completionHandler: { (response) in
            guard let data = response.value else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
        })
    }
    
}
