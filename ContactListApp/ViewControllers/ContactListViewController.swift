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
        tableView.delegate = dataSource
        
        let contactManager = ContactManager()
        dataSource.contactManager = contactManager
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showDetail(withNotification:)),
            name: NSNotification.Name("DidSelectRow notification"),
            object: nil)
        
        view.accessibilityIdentifier = "mainview"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addNewContact(_ sender: UIBarButtonItem) {
        if let newContactVC = storyboard?.instantiateViewController(    withIdentifier: "NewContactViewController"
        ) as? NewContactViewController {
            
            newContactVC.modalPresentationStyle = .fullScreen
            newContactVC.contacManager = dataSource.contactManager
            present(newContactVC, animated: true)
        }
    }
    
    @objc func showDetail(withNotification notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let person = userInfo["person"] as? Person,
            let detailVc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController"
            ) as? DetailViewController
        else { fatalError() }
        
        detailVc.person = person
        navigationController?.pushViewController(detailVc, animated: true)
    }
}

