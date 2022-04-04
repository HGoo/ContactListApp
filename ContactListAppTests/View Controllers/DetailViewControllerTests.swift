//
//  DetailViewControllerTests.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 04.04.2022.
//

import XCTest
@testable import ContactListApp

class DetailViewControllerTests: XCTestCase {
    
    var detailVC: DetailViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController"
            ) as? DetailViewController
        detailVC.loadViewIfNeeded()
    
    }

    override func tearDownWithError() throws {
        detailVC = nil
        try super.tearDownWithError()
    }

    func testHasNameLable() {
        XCTAssertNotNil(detailVC.nameLable)
        XCTAssertTrue(detailVC.nameLable.isDescendant(of: detailVC.view))
    }
    
    func testHasPhoneLable() {
        XCTAssertNotNil(detailVC.phoneLable)
        XCTAssertTrue(detailVC.phoneLable.isDescendant(of: detailVC.view))
    }
    
    func testHasSurnameLable() {
        XCTAssertNotNil(detailVC.surnameLable)
        XCTAssertTrue(detailVC.surnameLable.isDescendant(of: detailVC.view))
    }
    
    func testHasImageView() {
        XCTAssertNotNil(detailVC.imageView)
        XCTAssertTrue(detailVC.imageView.isDescendant(of: detailVC.view))
    }
    
    func testSetValueToNameLable() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.nameLable.text, "Foo")
    }
    
    func testSetValueSurnameLable() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.surnameLable.text, "Bar")

    }
    
    func testSetValueToPhoneLable() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.phoneLable.text, "Baz")

    }
    
    func testSetValueToImageview() {
        setupContactAndAppearanceTrancition()
        let imageData = UIImage(named: "unknown")?.pngData()
        XCTAssert(detailVC.person.imageData == imageData)
    }
    
    func testImageViewNotNil() {
        setupContactAndAppearanceTrancition()
        XCTAssertNotNil(detailVC.imageView.image)
    }
    
    func setupContactAndAppearanceTrancition() {
        guard let image = UIImage(named: "unknown") else { XCTFail(); return }
        let imageData = image.pngData()
        let person = Person(name: "Foo",
                            surname: "Bar",
                            phone: "Baz",
                            imagaData: imageData)
        
        detailVC.person = person
        
        detailVC.beginAppearanceTransition(true, animated: true)
        detailVC.endAppearanceTransition()
    }
    
}
