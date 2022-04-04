//
//  DetailViewController.swift
//  ContactListApp
//
//  Created by Николай Петров on 04.04.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var surnameLable: UILabel!
    @IBOutlet var phoneLable: UILabel!
    
    var person: Person!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let imageData = person.imageData else { return }
        guard let image = UIImage(data: imageData) else { return }
        
        nameLable.text = person.name
        surnameLable.text = person.surname
        phoneLable.text = person.phone
        imageView.image = image
    }
    
    
 

}
