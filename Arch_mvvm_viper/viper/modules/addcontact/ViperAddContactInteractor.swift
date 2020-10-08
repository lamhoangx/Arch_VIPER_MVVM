//
//  ViperAddContactInteractor.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation

class ViperAddContactInteractor: ViperAddContactInteractorProtocol {
    weak var presenter: ViperAddContactInteractorDelegate?
    var dataManager: ViperAddContactDataManagerProtocol?

    func saveNewContact(firstName: String, lastName: String) {
        if let contact = dataManager?.createContact(firstName: firstName, lastName: lastName) {
            presenter?.didSavedContact(contact: contact)
        }
    }
}

