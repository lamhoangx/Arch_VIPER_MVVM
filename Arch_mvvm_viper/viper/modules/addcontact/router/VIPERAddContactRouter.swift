//
//  AddContactWireFrame.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation


import UIKit

class VIPERAddContactRouter: AddContactRouterProtocol {

    class func createAddContactView(with delegate: AddContactPresenterDelegate) -> UIViewController {

        let navController = viperContactsStoryboard.instantiateViewController(withIdentifier: addContactViewIdentifer)
        if let view = navController as? VIPERAddContactView {
            // Generating module components
            let presenter: AddContactPresenterProtocol & AddContactInteractorDelegate = VIPERAddContactPresenter()
            let interactor: AddContactInteractorProtocol = VIPERAddContactInteractor()
            let dataManager: AddContactDataManagerProtocol = ContactsDataManager.shared
            let router: AddContactRouterProtocol = VIPERAddContactRouter()

            // Connecting
            view.presenter = presenter
            
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            presenter.contactsListener = delegate
            
            interactor.presenter = presenter
            interactor.dataManager = dataManager

            return navController
        }
        return UIViewController()
    }

    static var viperContactsStoryboard: UIStoryboard {
        return UIStoryboard(name: "VIPERContacts", bundle: Bundle.main)
    }
    
    static var addContactViewIdentifer: String {
        return "ADD_CONTACT_VIPER"
    }

    func dismissAddContact(from view: AddContactViewProtocol, completion: (() -> Void)?) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: completion)
        }
    }
}

extension ContactsDataManager: AddContactDataManagerProtocol {}
