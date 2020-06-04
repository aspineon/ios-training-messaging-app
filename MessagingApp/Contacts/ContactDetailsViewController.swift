//
//  ContactDetailsViewController.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 04/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contact = contact else {
            return
        }
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self,  let url = URL(string: contact.profilePhotoUrl), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.profileImage.image = image
            }
        }
        fullnameLabel.text = "\(contact.firstName) \(contact.lastName)"
    }
    
}
