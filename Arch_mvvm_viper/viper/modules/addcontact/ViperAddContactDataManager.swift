//
//  ViperAddContactDataManager.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation

class ViperAddContactDataManager: ViperAddContactDataManagerProtocol {
    func createContact(firstName: String, lastName: String) -> ContactModel {
        return ContactsDataManager.shared.createContact(firstName: firstName, lastName: lastName)
    }
    
    
}
