//
//  NewContactViewControllerTests.swift
//  ContactListAppTests
//
//  Created by Николай Петров on 04.04.2022.
//

import XCTest
@testable import ContactListApp

class NewContactViewControllerTests: XCTestCase {
    
    var newContactVC: NewContactViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        newContactVC = storyboard.instantiateViewController(
            withIdentifier: "NewContactViewController"
            ) as? NewContactViewController
        newContactVC.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        newContactVC = nil
        try super.tearDownWithError()
    }

    func testHasNameTextField() {
        XCTAssertTrue(newContactVC.nameTextField.isDescendant(of: newContactVC.view))
    }
    
    func testHasPhoneTextField() {
        XCTAssertTrue(newContactVC.phoneTextField.isDescendant(of: newContactVC.view))
    }
    
    func testHasSurnameTextField() {
        XCTAssertTrue(newContactVC.surnameTextField.isDescendant(of: newContactVC.view))
    }
    
    func testHasSaveButton() {
        XCTAssertTrue(newContactVC.saveButton.isDescendant(of: newContactVC.view))
    }
    
    func testHasCancelButton() {
        XCTAssertTrue(newContactVC.cancelButton.isDescendant(of: newContactVC.view))
    }
    
    func testSaveNewContact() {
        newContactVC.nameTextField.text = "Foo"
        newContactVC.surnameTextField.text = "Bar"
        newContactVC.phoneTextField.text = "Baz"
        
        newContactVC.contacManager = ContactManager()
        newContactVC.saveButtonPressed()
        
        let contact = newContactVC.contacManager.person(at: 0)
        let imageData = UIImage(named: "unknown")?.pngData()
        let person = Person(name: "Foo",
                            surname: "Bar",
                            phone: "Baz",
                            imagaData: imageData)
        XCTAssertEqual(contact, person)
    }
    
    func testSaveButtonHasSaveMethod() {
        let saveButton = newContactVC.saveButton
        guard let actions = saveButton?.actions(forTarget: newContactVC,
                                               forControlEvent: .touchUpInside)
        else { return }
        
        XCTAssertTrue(actions.contains("saveButtonPressed"))
    }
    
    func testSaveDismissesNewCintactViewController() {
        let mockNewContactVC = MockNewContactViewController()
        mockNewContactVC.nameTextField = UITextField()
        mockNewContactVC.nameTextField.text = "Foo"
        mockNewContactVC.surnameTextField = UITextField()
        mockNewContactVC.surnameTextField.text = "Bar"
        mockNewContactVC.phoneTextField = UITextField()
        mockNewContactVC.phoneTextField.text = "Baz"
        
        
        mockNewContactVC.contacManager = ContactManager()
        mockNewContactVC.saveButtonPressed()
        
        XCTAssertTrue(mockNewContactVC.isDismissed)
    }
    
    func testCancelDismissesNewCintactViewController() {
        let mockNewContactVC = MockNewContactViewController()
        mockNewContactVC.cancelButtonPressed()
        XCTAssertTrue(mockNewContactVC.isDismissed)
    }
}


extension NewContactViewControllerTests {
    class MockNewContactViewController: NewContactViewController {
        var isDismissed = false
        
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isDismissed = true
        }
    }
}
