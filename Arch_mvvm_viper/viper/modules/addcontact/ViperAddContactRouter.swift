//
//  ViperAddContactRouter.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation
import UIKit

class ViperAddContactRouter: ViperAddContactRouterProtocol {
    class func buildViperAddContactView(with delegate: AddContactDelegate) -> UIViewController? {
        let navController = getViperAddContactView()
        if let view = navController as? ViperAddContactViewProtocol {
            let presenter = ViperAddContactPresenter()
            let interactor = ViperAddContactInteractor()
            let router = ViperAddContactRouter()
            let dataManager = ViperAddContactDataManager()

            // view
            view.presenter = presenter
            
            // presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            presenter.addContactDelegate = delegate
            
            // interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
            
            return navController
        }
        return nil
    }

    static func getViperAddContactView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = getViperAddContactViewFromStoryboard()
        return view
    }
    
    static func getViperAddContactViewFromStoryboard() -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: viewIdentifier)
    }

    static var storyboard: UIStoryboard {
        let storyboardName = "VIPERContacts"
        return UIStoryboard(name: storyboardName, bundle: Bundle.main)
    }
    static var viewIdentifier: String {
        return "ADD_CONTACT_VIPER"
    }
    
    func dismissAddContact(from view: ViperAddContactViewProtocol, completion: (() -> Void)?) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: completion)
        }
    }
}
