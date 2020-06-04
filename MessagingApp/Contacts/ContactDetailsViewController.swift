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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contact = contact else {
            return
        }
        activityIndicator.startAnimating()
        loadImage(from: contact.profilePhotoUrl) {
            self.profileImage.image = $0
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        fullnameLabel.text = "\(contact.firstName) \(contact.lastName)"
    }
    
}
