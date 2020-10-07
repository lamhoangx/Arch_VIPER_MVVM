//
//  ContactViewModelController.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import Foundation

class MVVMContactViewModelController {
    var contactViewModelList: [ContactViewModel] = []
    var dataManager = ContactsDataManager.shared
    
    var contactsCount: Int {
        return contactViewModelList.count
    }
    
    func retrieveContacts(_ success: (() -> Void)?, failure: (() -> Void)?) {
        contactViewModelList = dataManager.retrieveContactList().map() {
            ContactViewModel(fullName: $0.fullName)
        }
        contactViewModelList.sort(by: {$0.fullName < $1.fullName})
        success?()
    }
    
    func getContactViewModel(at index: Int) -> ContactViewModel {
        return contactViewModelList[index]
    }
    
    func createContact(firstName: String, lastName: String,
                       success: ((ContactModel, Int) -> Void)?,
                       failure: (() -> Void)?) {
        let contact = dataManager.createContact(firstName: firstName, lastName: lastName)
        let contactViewModel = ContactViewModel(fullName: contact.fullName)
        let insertionIndex = contactViewModelList.insertionIndex(of: contactViewModel) { $0.fullName < $1.fullName }
        contactViewModelList.insert(contactViewModel, at: insertionIndex)
        success?(contact, insertionIndex)
    }
    
}
