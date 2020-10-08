//
//  ViperContactListPresenter.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation

class ViperContactListPresenter: ViperContactListPresenterProtocol {
    
    var router: ViperContactListRouterProtocol?
    weak var view: ViperContactListViewProtocol?
    var interactor: ViperContactListInteractorProtocol?
        
    func viewDidLoad() {
        // fetch data
        interactor?.retrieveContacts()
    }
    
    func presentAddContact(from view: ViperContactListViewProtocol) {
        router?.presentAddContact(from: view)
    }
}

// MARK: Interactor -> Presenter
extension ViperContactListPresenter: ViperContactListInteractorDelegate {
    func didRetrieveContacts(_ contacts: [ContactModel]) {
        var contactsModelView = contacts.map() {
            ContactViewModel(fullName: $0.fullName)
        }
        contactsModelView.sort(by: {$0.fullName < $1.fullName})
        view?.reloadInterface(with: contactsModelView)
    }
}

extension ViperContactListPresenter: AddContactDelegate {
    func didAddContact(_ contact: ContactModel) {
        let contactViewModel = ContactViewModel(fullName: contact.fullName)
        view?.didInsertContact(contactViewModel)
    }
    
    func didCancelAddContact() {}
    
}
