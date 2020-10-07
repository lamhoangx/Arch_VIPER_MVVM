//
//  AddContactInteractor.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation

class VIPERAddContactInteractor: AddContactInteractorProtocol {
    weak var presenter: AddContactInteractorDelegate?
    var dataManager: AddContactDataManagerProtocol?
    
    func saveNewContact(firstName: String, lastName: String) {
        if let contact = dataManager?.createContact(firstName: firstName, lastName: lastName) {
            presenter?.didSavedContact(contact: contact)
        }
    }
}
