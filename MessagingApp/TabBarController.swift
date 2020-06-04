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
        let contactsViewController = viewController(fromStoryboard: "Contacts", withIdentifier: "contactsViewController")
        let photosViewController = viewController(fromStoryboard: "Photos", withIdentifier: "photosViewController")
        
        viewControllers = [
            UINavigationController(rootViewController: MessagesViewController()),
            UINavigationController(rootViewController: contactsViewController),
            UINavigationController(rootViewController: photosViewController)
        ]
        
        tabBar.tintColor = .darkGray
        tabBar.items?[0].title = "Messages"
        tabBar.items?[0].image = UIImage.fontAwesomeIcon(name: .addressBook, style: .regular, textColor: .lightGray, size: CGSize(width: 25,height: 25))
        tabBar.items?[1].image = UIImage.fontAwesomeIcon(name: .comment, style: .regular, textColor: .lightGray, size: CGSize(width: 25,height: 25))
        tabBar.items?[2].image = UIImage.fontAwesomeIcon(name: .image, style: .regular, textColor: .lightGray, size: CGSize(width: 25,height: 25))
    }
    
    
    private func viewController(fromStoryboard storyboardName: String, withIdentifier identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: identifier)
        viewController.title = storyboardName
        return viewController
    }
  
}
