//
//  ContactViewController.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 03/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var contactsSerach: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    let contacts = [
        Contact(firstName: "Jan", lastName: "Kowalski", profilePhotoUrl: ""),
        Contact(firstName: "Marek", lastName: "Nowak", profilePhotoUrl: ""),
        Contact(firstName: "Anna", lastName: "Wesołowska", profilePhotoUrl: "")
    ]
    var contactsService: ContactsService?
    var filteredContacts: [Contact]?
    
    override func viewDidLoad() {
        do {
            contactsService = try SQLiteContactsService(dbFile: "db.sqlite3")
        } catch let error {
            print("Exception: \(error)")
        }
        contactsService?.add(contact: contacts[0])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredContacts?.count ?? contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell")!
        let contact =  filteredContacts == nil ? contacts[indexPath.row] : filteredContacts![indexPath.row]
        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
        cell.imageView?.image = UIImage(named: "profile")
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContacts = contacts.filter { $0.lastName.hasPrefix(searchText) }
        contactsTableView.reloadData()
    }
    
}
