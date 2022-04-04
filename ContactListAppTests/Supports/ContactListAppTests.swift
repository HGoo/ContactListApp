//
//  ContactListAppTests.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 01.04.2022.
//

import XCTest
@testable import ContactListApp

class ContactListAppTests: XCTestCase {
    
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testInitialViewControllerIsContactListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers.first
        
        XCTAssertTrue(rootViewController is ContactListViewController)
    }
}
