//
//  ContactListDataSourceTests.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 03.04.2022.
//

import XCTest
@testable import ContactListApp

class ContactListDataSourceTests: XCTestCase {

    var dataSource: ContactListDataSource!
    var mocktableView: MocktableView!
    var contactListVC: ContactListViewController!
    var person: Person!
    
    override func setUpWithError() throws {
       try super.setUpWithError()
        dataSource = ContactListDataSource()
        dataSource.contactManager = ContactManager()
        
        mocktableView = MocktableView.mockTableView(withDataSource: dataSource)
        person = Person(name: "Foo", phone: "Bar")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        contactListVC = storyboard.instantiateViewController(
            withIdentifier: "ContactListViewController") as? ContactListViewController
        
        contactListVC.loadViewIfNeeded()
   
    }

    override func tearDownWithError() throws {
        dataSource = nil
        mocktableView = nil
        contactListVC = nil
        person = nil
        try super.tearDownWithError()
    }

    func testHasOneSection() {
        let numberOfSection = mocktableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func testNumberOfRowsequalsContactListcount() {
        dataSource.contactManager?.add(person: person)
        XCTAssertEqual(mocktableView.numberOfRows(inSection:0), 1)
        
        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Baz"))
        mocktableView.reloadData()
        XCTAssertEqual(mocktableView.numberOfRows(inSection:0), 2)
    }
    
    func testCellForRowAtIndexPathReturnsContactCell() {
        dataSource.contactManager?.add(person: person)
        mocktableView.reloadData()
        
        let cell = mocktableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ContactCell)
    }
    
    func testCellForRowDequeueCellFromTable() {
        dataSource.contactManager?.add(person: person)
        mocktableView.reloadData()
        
        _ = mocktableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssert(mocktableView.cellIsDequeued)
    }
    
    func testCellForRowCallsConfigureCell() {
        dataSource.contactManager?.add(person: person)
        mocktableView.reloadData()
        
        let cell = mocktableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockContactCell
        
        XCTAssertEqual(cell.person, person)
    }
    
}

extension ContactListDataSourceTests {
    class MocktableView: UITableView {
        var cellIsDequeued = false
    
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        static func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MocktableView {
            let mockTableView = MocktableView()
            mockTableView.dataSource = dataSource
            mockTableView.register(MockContactCell.self, forCellReuseIdentifier: "cell")
            return mockTableView
        }
        
    }
    
    class MockContactCell: ContactCell {
        var person: Person?
        
        override func configure(with person: Person) {
            self.person = person
        }
    }
}
