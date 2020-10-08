//
//  ViperContactListDataManager.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/8/20.
//

import Foundation

class ViperContactListDataManager: ViperContactListDataManagerProtocol {
    func retrieveContactList() -> [ContactModel] {
        return ContactsDataManager.shared.retrieveContactList()
    }
}
