//
//  ContactsService.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 04/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

protocol ContactsService {
    
    func add(contact: Contact)
    
    func getAll() -> [Contact]
    
}
