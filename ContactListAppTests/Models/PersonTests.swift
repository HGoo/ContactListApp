//
//  PersonTests.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 01.04.2022.
//

import XCTest
@testable import ContactListApp

class PersonTests: XCTestCase {
    
    
    var image: UIImage?
    var imageData: Data?

    override func setUpWithError() throws {
        try super.setUpWithError()
        image = UIImage(named: "unknown")
        guard let image = image else { return }
        imageData = image.pngData()
    }

    override func tearDownWithError() throws {
        image = nil
        imageData = nil
        try super.tearDownWithError()
    }

    func testInpurPersonWithNameAndPhone() {
        
        let person = Person(name: "Foo", phone: "Bar")
        
        XCTAssertNotNil(person)
    }
    
    func testInpurPersonWithFullNameAndPhone() {
        
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertNotNil(person)
    }
    
    func testtestWhenGivenNameAndPhoneSetsNameAndPone() {
        
        let person = Person(name: "Foo", phone: "Bar")
        
        XCTAssertEqual(person.name, "Foo")
        XCTAssertEqual(person.phone, "Bar")
    }
    
    func testtestWhenGivenSurnameSetSurname() {
        
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertTrue(person.surname == "Bar")
    }
    
    func testInitPersonWithDate() {
        let person = Person(name: "Foo", phone: "Bar")
        
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithFullNameAndDate() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithImage() {
    
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        
        XCTAssertNotNil(person.imageData)
    }
    
    func testInitPersonWithFullNnameAndImage() {
     
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz", imagaData: imageData)
        
        XCTAssertNotNil(person.imageData)
    }
    
    
}
