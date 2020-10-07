//
//  ContactListProtocol.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/4/20.
//

import Foundation
import UIKit

// View
protocol ContactListViewProtocol: class {
    var presenter: ContactListPresenterProtocol? { get set }
}

// Presenter
protocol ContactListPresenterProtocol: class {
    var view: ContactListPresenterDelegate? { get set }
    var interactor: ContactListInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }

    // func
    func viewDidLoad()
    func presentAddContact(from view: ContactListViewProtocol)
}
// Presenter -> View
protocol ContactListPresenterDelegate: class {
    func didInsertContact(_ contact: ContactViewModel)
    func reloadInterface(with contacts: [ContactViewModel])
}

// Router
protocol ContactListRouterProtocol: class {
    static func createContactListModule() -> UIViewController

    // func
    func presentAddContact(from view: ContactListViewProtocol)
}

// Interactor
protocol ContactListInteractorProtocol: class {
    var presenter: ContactListInteractorDelegate? {get set}
    var dataManager: ContactListDataManagerProtocol? {get set}
    
    // func
    func retrieveContacts()
}
// Interactor -> Presenter
protocol ContactListInteractorDelegate: class {
    func didRetrieveContacts(_ contacts: [ContactModel])
}

// DataManager
protocol ContactListDataManagerProtocol: class {
    func retrieveContactList() -> [ContactModel]
}

