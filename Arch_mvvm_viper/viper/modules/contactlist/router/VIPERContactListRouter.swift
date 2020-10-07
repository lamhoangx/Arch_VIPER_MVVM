//
//  ContactListWireFrame.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation
import UIKit

class VIPERContactListRouter: ContactListRouterProtocol {
    
    class func createContactListModule() -> UIViewController {
        let navController = viperContactsStoryboard.instantiateViewController(withIdentifier: contactListIdentifier)
        if let view = navController as? VIPERContactListView {
            let presenter: ContactListPresenterProtocol & ContactListInteractorDelegate = VIPERContactListPresenter()
            let interactor: ContactListInteractorProtocol = VIPERContactListInteractor()
            let dataManager: ContactListDataManagerProtocol = ContactsDataManager.shared
            let router: ContactListRouterProtocol = VIPERContactListRouter()
            
            // view
            view.presenter = presenter
            
            // presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            
            // interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
            
            return navController
        }
        return UIViewController()
    }
    
    static var viperContactsStoryboard: UIStoryboard {
        return UIStoryboard(name: "VIPERContacts", bundle: Bundle.main)
    }
    static var contactListIdentifier: String {
        return "MAIN_VIPER"
    }
    
    func presentAddContact(from view: ContactListViewProtocol) {
        guard let delegate = view.presenter as? AddContactPresenterDelegate else {
            return
        }
        let addContactsView = VIPERAddContactRouter.createAddContactView(with: delegate)
        if let sourceView = view as? UIViewController {
            sourceView.present(addContactsView, animated: true, completion: nil)
        }
    }
}

extension ContactsDataManager: ContactListDataManagerProtocol {}
