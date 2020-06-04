//
//  ContactViewController.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 03/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let contacts = [
        Contact(firstName: "Jan", lastName: "Kowalski", profilePhotoUrl: ""),
        Contact(firstName: "Marek", lastName: "Nowak", profilePhotoUrl: ""),
        Contact(firstName: "Anna", lastName: "Wesołowska", profilePhotoUrl: "")
    ]
    var contactsService: ContactsService?
    
    override func viewDidLoad() {
        do {
            contactsService = try SQLiteContactsService(dbFile: "db.sqlite3")
        } catch let error {
            print("Exception: \(error)")
        }
        contactsService?.add(contact: contacts[0])
        print(contactsService?.getAll())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell")!
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
        cell.imageView?.image = UIImage(named: "profile")
        return cell
    }
    
}
