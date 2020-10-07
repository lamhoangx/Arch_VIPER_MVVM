//
//  AddContactPresenter.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation

class VIPERAddContactPresenter: AddContactPresenterProtocol {
    weak var view: AddContactViewProtocol?
    weak var contactsListener: AddContactPresenterDelegate?
    var interactor: AddContactInteractorProtocol?
    var router: AddContactRouterProtocol?

    func cancelAddContact() {
        if let view = view, let router = router {
            router.dismissAddContact(from: view) { [self] in
                contactsListener?.didCancelAddContact()
            }
        }
    }

    func addNewContact(firstName: String, lastName: String) {
        interactor?.saveNewContact(firstName: firstName, lastName: lastName)
    }
}

extension VIPERAddContactPresenter: AddContactInteractorDelegate {
    func didSavedContact(contact: ContactModel) {
        if let view = view, let router = router {
            router.dismissAddContact(from: view, completion: { [self] in
                contactsListener?.didAddContact(contact)
            })
        }
    }
}
