//
//  ContactLocalDataManager.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import Foundation

import CoreData

open class ContactsDataManager {
    static let shared = ContactsDataManager()
    private init() {}

    func createContact(firstName: String,
                       lastName: String) -> ContactModel {
        return CoreDataStore.createContact(firstName: firstName,
                                           lastName: lastName)
    }

    func retrieveContactList() -> [ContactModel] {
        return CoreDataStore.contactsFake
    }

}
