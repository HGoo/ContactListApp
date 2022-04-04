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
        
        let contactManager = ContactManager()
        dataSource.contactManager = contactManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addNewContact(_ sender: UIBarButtonItem) {
        if let newContactVC = storyboard?.instantiateViewController(    withIdentifier: "NewContactViewController"
        ) as? NewContactViewController {
            
            newContactVC.modalPresentationStyle = .fullScreen
            newContactVC.presentationController?.delegate = newContactVC
            newContactVC.contacManager = dataSource.contactManager
            present(newContactVC, animated: true)
        }
    }
}

