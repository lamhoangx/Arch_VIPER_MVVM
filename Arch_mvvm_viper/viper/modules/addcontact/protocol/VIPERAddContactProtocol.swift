//
//  AddContactProtocol.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation

import UIKit

// View
protocol AddContactViewProtocol: class {
    var presenter: AddContactPresenterProtocol? { get set }
}

// Presenter
protocol AddContactPresenterProtocol: class {
    var view: AddContactViewProtocol? { get set }
    var interactor: AddContactInteractorProtocol? { get set }
    var router: AddContactRouterProtocol? { get set }
    
    // external
    var contactsListener: AddContactPresenterDelegate? { get set }

    // func
    func cancelAddContact()
    func addNewContact(firstName: String, lastName: String)
}
protocol AddContactPresenterDelegate: class {
    func didAddContact(_ contact: ContactModel)
    func didCancelAddContact()
}

// Router
protocol AddContactRouterProtocol: class {
    static func createAddContactView(with delegate: AddContactPresenterDelegate) -> UIViewController
    // func
    func dismissAddContact(from view: AddContactViewProtocol, completion: (() -> Void)?)
}

// Interactor
protocol AddContactInteractorProtocol: class {
    var presenter: AddContactInteractorDelegate? { get set }
    var dataManager: AddContactDataManagerProtocol? { get set }

    // func
    func saveNewContact(firstName: String, lastName: String)
}
protocol AddContactInteractorDelegate: class {
    func didSavedContact(contact: ContactModel)
}

// DataManager
protocol AddContactDataManagerProtocol: class {
    func createContact(firstName: String, lastName: String) -> ContactModel
}




