//
//  TabBarController.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 03/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        let contactsStoryboard = UIStoryboard(name: "Contacts", bundle: Bundle.main)
        let contactsViewController = contactsStoryboard.instantiateViewController(identifier: "contactsViewController")
        
        viewControllers = [
            UINavigationController(rootViewController: MessagesViewController()),
            UINavigationController(rootViewController: contactsViewController)
        ]
    }
    
}
