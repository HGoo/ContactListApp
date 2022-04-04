//
//  ContactListAppUITests.swift
//  ContactListAppUITests
//
//  Created by Николай Петров on 04.04.2022.
//

import XCTest

class ContactListAppUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.isMainView)
        
        app.navigationBars["ContactListApp.ContactListView"].buttons["Add"].tap()
        
        app.textFields["Name"].tap()
        app.textFields["Name"].typeText("Foo")
        app.textFields["Surname"].tap()
        app.textFields["Surname"].typeText("Bar")
        app.textFields["Phone"].tap()
        app.textFields["Phone"].typeText("Baz")
        
        XCTAssertFalse(app.isMainView)
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Save"]/*[[".buttons[\"Save\"].staticTexts[\"Save\"]",".staticTexts[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
       
        XCTAssertTrue(app.tables.staticTexts["Foo"].exists)
        
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIApplication {
    var isMainView: Bool {
        return otherElements["mainview"].exists
    }
}
