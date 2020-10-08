//
//  ViperAddContactProtocol.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation
import UIKit

// MARK: Router
protocol ViperAddContactRouterProtocol: class {
    static func buildViperAddContactView(with delegate: AddContactDelegate) -> UIViewController?
    
    // func for redirect
    func dismissAddContact(from view: ViperAddContactViewProtocol, completion: (() -> Void)?)
}

// MARK: View
protocol ViperAddContactViewProtocol: class {
    var presenter: ViperAddContactPresenterProtocol? { get set }
    
    // func for presenter -> view
    
}

// MARK: Presenter
protocol ViperAddContactPresenterProtocol: class {
    var router: ViperAddContactRouterProtocol? { get set }
    var view: ViperAddContactViewProtocol? { get set }
    var interactor: ViperAddContactInteractorProtocol? { get set }
    
    // external
    var addContactDelegate: AddContactDelegate? { get set }
    
    // func for presenter -> interactor
    func viewDidLoad()
    func cancelAddContact()
    func addNewContact(firstName: String, lastName: String)
    
}
// Extends by presenter to receive notifies from interactor
protocol ViperAddContactInteractorDelegate: class {
    //func for interactor -> presenter
    func didSavedContact(contact: ContactModel)
}

// MARK: Interactor
protocol ViperAddContactInteractorProtocol: class {
    var presenter: ViperAddContactInteractorDelegate? { get set }
    var dataManager: ViperAddContactDataManagerProtocol? { get set }
    
    // func for presenter -> interactor
    func saveNewContact(firstName: String, lastName: String)
}

// MARK: DataManager
// Manage services to knows about entity
protocol ViperAddContactDataManagerProtocol: class {
    func createContact(firstName: String, lastName: String) -> ContactModel
}
