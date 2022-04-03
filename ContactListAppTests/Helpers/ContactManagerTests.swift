//
//  ContactManagerTests.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 03.04.2022.
//

import XCTest
@testable import ContactListApp

class ContactManagerTests: XCTestCase {
    var contactManager: ContactManager!
    var person: Person!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        person = Person(name: "Foo", phone: "Bar")
        contactManager = ContactManager()
        
    }
    
    override func tearDownWithError() throws {
        contactManager = nil
        person = nil
        
        try super.tearDownWithError()
    }
    
    func testInitContactManagerWithEmptyList() {
        XCTAssertEqual(contactManager.contactsCount, 0)
    }

    
    func testAddPersonIncrementContactListCount() {
        contactManager.add(person: person)
        
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
    
    
    func testcontactAtIndexIsAddedPerson() {
        contactManager.add(person: person)
        let returnedPerson = contactManager.person(at: 0)
        
        XCTAssertEqual(person, returnedPerson)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
}

