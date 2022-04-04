//
//  ContactListViewControllerTest.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 03.04.2022.
//

import XCTest
@testable import ContactListApp

class ContactListViewControllerTest: XCTestCase {
    
    var sut: ContactListViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ContactListViewController") as? ContactListViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedContactListDataSourceIsNotNill() {
        XCTAssertNotNil(sut.dataSource)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is ContactListDataSource)
    }
    
    func testHasAddNewContactButton() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? ContactListViewController, sut)
    }
    
    func testOpenNewContactViewController() {
        let newContactVC = presentingNewContactViewController()
        XCTAssertNotNil(newContactVC.nameTextField)
    }
    
    func testSharedSameContactManagerWithNewContact() {
        let newContactVC = presentingNewContactViewController()

        XCTAssertNotNil(sut.dataSource.contactManager)
        XCTAssertTrue(newContactVC.contacManager === sut.dataSource.contactManager)
    }
    
    func testWhenViewAppearedTableViewReloaded() {
        let mockTableView = MockTableView()
        sut.tableView = mockTableView
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertTrue((sut.tableView as! MockTableView).isReloaded)
    }
    
    func presentingNewContactViewController() -> NewContactViewController {
        guard
            let addNewContactButton = sut.navigationItem.rightBarButtonItem,
            let action = addNewContactButton.action
        else {
            return NewContactViewController()
        }
        
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.performSelector(onMainThread: action,
                            with: addNewContactButton,
                            waitUntilDone: true)
        
        let newContactVC = sut.presentedViewController as! NewContactViewController
        
        return newContactVC
    }
}

extension ContactListViewControllerTest {
    class MockTableView: UITableView {
        var isReloaded = false
        
        override func reloadData() {
            isReloaded = true
        }
    }
}
