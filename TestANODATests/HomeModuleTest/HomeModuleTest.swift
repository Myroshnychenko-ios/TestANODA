//
//  HomeModuleTest.swift
//  TestANODATests
//
//  Created by Максим Мирошниченко on 27.10.2021.
//

import XCTest
@testable import TestANODA

class MockHomeView: HomeViewProtocol {
    
    var errorTest: Error?
    
    func success() {
        
    }
    
    func failure(error: Error) {
        self.errorTest = error
    }
    
}

class HomeModuleTest: XCTestCase {
    
    var view: MockHomeView!
    var navigationController: UINavigationController!
    var builder: BuilderProtocol!
    var router: RouterProtocol!
    var loader: DataLoader!
    var presenter: HomePresenter!
    var publication: PublicationData!

    override func setUpWithError() throws {
        view = MockHomeView()
        navigationController = UINavigationController()
        builder = Builder()
        router = Router(navigationController: navigationController, builder: builder)
        loader = DataLoader()
        presenter = HomePresenter(view: view, router: router, dataLoader: loader)
        publication = PublicationData(userID: 0, userName: "Name", userPhoto: "Photo", location: "Location", publicationImages: ["Image1", "Image2"], isRate: false, isFavorites: true, likes: 999, publicationTitle: nil, hashtags: nil, commentsCount: 5)
    }

    override func tearDownWithError() throws {
        view = nil
        navigationController = nil
        builder = nil
        router = nil
        loader = nil
        presenter = nil
        publication = nil
    }
    
    func testHomeIsNotNil() {
        XCTAssertNotNil(view, "view - is not nil")
        XCTAssertNotNil(navigationController, "navigationController - is not nil")
        XCTAssertNotNil(builder, "builder - is not nil")
        XCTAssertNotNil(router, "router - is not nil")
        XCTAssertNotNil(loader, "loader - is not nil")
        XCTAssertNotNil(presenter, "presenter - is not nil")
        XCTAssertNotNil(publication, "publication - is not nil")
    }
    
    func testPublicationModel() {
        XCTAssertEqual(publication.userID, 0)
        XCTAssertEqual(publication.userName, "Name")
        XCTAssertEqual(publication.userPhoto, "Photo")
        XCTAssertEqual(publication.location, "Location")
        XCTAssertEqual(publication.publicationImages, ["Image1", "Image2"])
        XCTAssertEqual(publication.publicationTitle, nil)
        XCTAssertEqual(publication.isRate, false)
        XCTAssertEqual(publication.isFavorites, true)
        XCTAssertEqual(publication.likes, 999)
        XCTAssertEqual(publication.publicationTitle, nil)
        XCTAssertEqual(publication.hashtags, nil)
        XCTAssertEqual(publication.commentsCount, 5)
    }

}
