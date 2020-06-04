//
//  SQLiteContactsService.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 04/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import Foundation
import SQLite

class SQLiteContactsService: ContactsService {
    
    private let db: Connection
    private let id = Expression<Int>("id")
    private let contacts = Table("contacts")
    private let firstName = Expression<String>("first_name")
    private let lastName = Expression<String>("last_name")
    private let profilePhotoUrl = Expression<String>("profile_photo_url")
    private let contactsUrl = URL(string: "https://raw.githubusercontent.com/landrzejewski/ios-training-messaging-app/master/contacts.json")!
    
    var delegate: ContactsServiceDelegate?
    
    init(dbFile: String) throws {
        //let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        //db = try Connection("\(path)/\(dbFile)")
        db = try Connection()
        db.trace { print($0) }
        try db.run(contacts.create(ifNotExists: true) { table in
            table.column(id, primaryKey: .autoincrement)
            table.column(firstName)
            table.column(lastName)
            table.column(profilePhotoUrl)
        })
    }
    
    func add(contact: Contact) {
        let insert = contacts.insert(firstName <- contact.firstName, lastName <- contact.lastName, profilePhotoUrl <- contact.profilePhotoUrl)
        _ = try? db.run(insert)
    }
    
    func getAll() -> [Contact] {
        let result =  try? db.prepare(contacts)
            .map { Contact(firstName: $0[firstName], lastName: $0[lastName], profilePhotoUrl: $0[profilePhotoUrl]) }
        return result ?? []
    }
    
    func refresh() {
        let request = URLRequest(url: contactsUrl)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data, let contacts = try? JSONDecoder().decode(Contacts.self, from: jsonData).contacts else {
                return
            }
            contacts.forEach(self.add(contact:))
            DispatchQueue.main.async {
                self.delegate?.contactsRefreshed()
            }
        }.resume()
    }
    
}
