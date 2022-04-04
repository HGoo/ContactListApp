//
//  NewContactViewController.swift
//  ContactListApp
//
//  Created by Николай Петров on 04.04.2022.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var contacManager: ContactManager!
    
    
    @IBAction func saveButtonPressed() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let phone = phoneTextField.text
        
        let imageData = UIImage(named: "unknown")?.pngData()
        let person = Person(name: name ?? "",
                            surname: surname ?? "",
                            phone: phone ?? "",
                            imagaData: imageData)
        
        contacManager.add(person: person)
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }

}
