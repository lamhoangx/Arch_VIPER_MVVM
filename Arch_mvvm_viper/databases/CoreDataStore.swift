//
//  CoreDataStore.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/4/20.
//

import Foundation

class CoreDataStore {
    static var contactsFake: [ContactModel] = [
        ContactModel(firstName: "AAA", lastName: "AAA"),
        ContactModel(firstName: "BBB", lastName: "BBB"),
        ContactModel(firstName: "CCC", lastName: "CCC"),
        ContactModel(firstName: "DDD", lastName: "DDD"),
        ContactModel(firstName: "EEE", lastName: "EEE"),
        ContactModel(firstName: "FFF", lastName: "FFF")
    ]
    
    static func createContact(firstName: String,
                              lastName: String) -> ContactModel {
        let contact = ContactModel(firstName: firstName, lastName: lastName)
        contactsFake.insert(contact, at: contactsFake.endIndex)
        return contact
    }
}
