//
//  ContactListDataSource.swift
//  ContactListApp
//
//  Created by Николай Петров on 03.04.2022.
//

import UIKit

class ContactListDataSource: NSObject {
    var contactManager: ContactManager?
    
}

// MARK: - Table View Data Sourse
extension ContactListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager?.contactsCount ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactCell
        
        if let person = contactManager?.person(at: indexPath.row) {
            cell.configure(with: person)
        }
    
        return cell
    }

}


