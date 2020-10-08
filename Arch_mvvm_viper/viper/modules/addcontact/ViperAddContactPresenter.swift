//
//  ViperAddContactPresenter.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation

class ViperAddContactPresenter: ViperAddContactPresenterProtocol {
    
    var router: ViperAddContactRouterProtocol?
    weak var view: ViperAddContactViewProtocol?
    var interactor: ViperAddContactInteractorProtocol?
    var addContactDelegate: AddContactDelegate?
    
    func viewDidLoad() {}
    
    func cancelAddContact() {
        if let view = view, let router = router {
            router.dismissAddContact(from: view) { [self] in
                addContactDelegate?.didCancelAddContact()
            }
        }
    }

    func addNewContact(firstName: String, lastName: String) {
        interactor?.saveNewContact(firstName: firstName, lastName: lastName)
    }
}

// MARK: Interactor -> Presenter
extension ViperAddContactPresenter: ViperAddContactInteractorDelegate {
    func didSavedContact(contact: ContactModel) {
        if let view = view, let router = router {
            router.dismissAddContact(from: view, completion: { [self] in
                addContactDelegate?.didAddContact(contact)
            })
        }
    }
}
