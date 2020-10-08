//
//  ViperContactListRouter.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation
import UIKit

class ViperContactListRouter: ViperContactListRouterProtocol {
    class func buildViperContactListView() -> UIViewController? {
        let navController = getViperContactListView()
        if let view = navController as? ViperContactListViewProtocol {
            let presenter = ViperContactListPresenter()
            let interactor = ViperContactListInteractor()
            let router = ViperContactListRouter()
            let dataManager = ViperContactListDataManager()

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
        return nil
    }

    static func getViperContactListView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = getViperContactListViewFromStoryboard()
        return view
    }
    
    static func getViperContactListViewFromStoryboard() -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: viewIdentifier)
    }

    static var storyboard: UIStoryboard {
        let storyboardName = "VIPERContacts"
        return UIStoryboard(name: storyboardName, bundle: Bundle.main)
    }
    static var viewIdentifier: String {
        return "MAIN_VIPER"
    }
    
    
    //
    func presentAddContact(from view: ViperContactListViewProtocol) {
        guard let delegate = view.presenter as? AddContactDelegate else {
            return
        }
        let addContactsView = ViperAddContactRouter.buildViperAddContactView(with: delegate)
        if let sourceView = view as? UIViewController, let addContactsView = addContactsView {
            sourceView.present(addContactsView, animated: true, completion: nil)
        }
    }
    
}
