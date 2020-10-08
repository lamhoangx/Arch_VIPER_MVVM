//
//  ViperContactListInteractor.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation

class ViperContactListInteractor: ViperContactListInteractorProtocol {
    weak var presenter: ViperContactListInteractorDelegate?
    var dataManager: ViperContactListDataManagerProtocol?

    func retrieveContacts() {
        if let contactList = dataManager?.retrieveContactList() {
            presenter?.didRetrieveContacts(contactList)
        } else {
            presenter?.didRetrieveContacts([])
        }
    }
}

