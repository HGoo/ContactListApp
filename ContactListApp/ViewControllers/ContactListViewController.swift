//
//  ContactListViewController.swift
//  ContactListApp
//
//  Created by Николай Петров on 01.04.2022.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataSource: ContactListDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
}

