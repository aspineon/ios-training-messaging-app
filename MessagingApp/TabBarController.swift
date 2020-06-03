//
//  TabBarController.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 03/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit
import FontAwesome_swift

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        let contactsStoryboard = UIStoryboard(name: "Contacts", bundle: Bundle.main)
        let contactsViewController = contactsStoryboard.instantiateViewController(identifier: "contactsViewController")
        contactsViewController.title = "Contacts"
        
        viewControllers = [
            UINavigationController(rootViewController: MessagesViewController()),
            UINavigationController(rootViewController: contactsViewController)
        ]
        
        tabBar.tintColor = .darkGray
        tabBar.items?[0].title = "Messages"
        tabBar.items?[0].image = UIImage.fontAwesomeIcon(name: .addressBook, style: .regular, textColor: .lightGray, size: CGSize(width: 25,height: 25))
        tabBar.items?[1].image = UIImage.fontAwesomeIcon(name: .comment, style: .regular, textColor: .lightGray, size: CGSize(width: 25,height: 25))
    }
    
}
