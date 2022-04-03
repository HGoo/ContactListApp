//
//  ContactCell.swift
//  ContactListApp
//
//  Created by Николай Петров on 03.04.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet var nameLable: UILabel!
    
    func configure(with person: Person) {
        nameLable.text = person.name
    }
}

