//
//  VIPERContactListPresenter.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation
import UIKit

class VIPERContactListPresenter: ContactListPresenterProtocol {
    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?
    
    func viewDidLoad() {
        // fetch data
        interactor?.retrieveContacts()
    }
    
    func presentAddContact(from view: ContactListViewProtocol) {
        router?.presentAddContact(from: view)
    }
}

extension VIPERContactListPresenter: ContactListInteractorDelegate {
    func didRetrieveContacts(_ contacts: [ContactModel]) {
        var contactsModelView = contacts.map() {
            ContactViewModel(fullName: $0.fullName)
        }
        contactsModelView.sort(by: {$0.fullName < $1.fullName})
        view?.reloadInterface(with: contactsModelView)
    }
}

extension VIPERContactListPresenter: AddContactPresenterDelegate {
    func didAddContact(_ contact: ContactModel) {
        let contactViewModel = ContactViewModel(fullName: contact.fullName)
        view?.didInsertContact(contactViewModel)
    }
    
    func didCancelAddContact() {}
    
}
