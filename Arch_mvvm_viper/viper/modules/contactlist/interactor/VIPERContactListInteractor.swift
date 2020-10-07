//
//  VIPERContactListInteractor.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation

class VIPERContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    var dataManager: ContactListDataManagerProtocol?
    
    func retrieveContacts() {
        if let contactList = dataManager?.retrieveContactList() {
            presenter?.didRetrieveContacts(contactList)
        } else {
            presenter?.didRetrieveContacts([])
        }
    }
}
