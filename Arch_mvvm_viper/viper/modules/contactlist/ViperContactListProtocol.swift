//
//  ViperContactListProtocol.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation
import UIKit

// MARK: Router
protocol ViperContactListRouterProtocol: class {
    static func buildViperContactListView() -> UIViewController?

    // func for redirect
    func presentAddContact(from view: ViperContactListViewProtocol)
}

// MARK: View
protocol ViperContactListViewProtocol: class {
    var presenter: ViperContactListPresenterProtocol? { get set }

    // func for presenter -> view
    func didInsertContact(_ contact: ContactViewModel)
    func reloadInterface(with contacts: [ContactViewModel])
}

// MARK: Presenter
protocol ViperContactListPresenterProtocol: class {
    var router: ViperContactListRouterProtocol? {get set}
    var view: ViperContactListViewProtocol? { get set }
    var interactor: ViperContactListInteractorProtocol? {get set}

    // func for presenter -> interactor
    func viewDidLoad()
    func presentAddContact(from view: ViperContactListViewProtocol)

}
// Extends by presenter to receive notifies from interactor
protocol ViperContactListInteractorDelegate: class {
    //func for interactor -> presenter
    func didRetrieveContacts(_ contacts: [ContactModel])
}

// MARK: Interactor
protocol ViperContactListInteractorProtocol: class {
    var presenter: ViperContactListInteractorDelegate? {get set}
    var dataManager: ViperContactListDataManagerProtocol? {get set}

    // func for presenter -> interactor
    func retrieveContacts()
}

// MARK: DataManager
// Manage services to knows about entity
protocol ViperContactListDataManagerProtocol: class {
    func retrieveContactList() -> [ContactModel]
}


//

protocol AddContactDelegate: class {
    func didAddContact(_ contact: ContactModel)
    func didCancelAddContact()
}
