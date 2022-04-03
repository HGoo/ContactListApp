//
//  ContactCellTest.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 03.04.2022.
//

import XCTest
@testable import ContactListApp

class ContactCellTest: XCTestCase {
    
    var cell: ContactCell!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "ContactListViewController") as! ContactListViewController
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView
        let dataSource = MockTableViewDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(
            withIdentifier: "cell",
            for: IndexPath(row: 0, section: 0)
        ) as? ContactCell
    }

    override func tearDownWithError() throws {
        cell = nil
        try super.tearDownWithError()
    }
    
    func testCellHasNameLable() {
        XCTAssertNotNil(cell.nameLable)
    }
    
    func testCellHasNameLableInContentView() {
        XCTAssertTrue(cell.nameLable.isDescendant(of: cell.contentView))
    }
    
    func testConfigureSetsName() {
        let person = Person(name: "Foo", phone: "Bar")
        cell.configure(with: person)
        XCTAssertEqual(cell.nameLable.text, person.name)
    }
}

extension ContactCellTest {
    class MockTableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
