//
//  ContactModel.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation

open class ContactModel {
    var firstName: String?
    var lastName: String?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        get {
            var name = ""
            if let firstName = firstName {
                name += firstName
            }
            if let lastName = lastName {
                name += " \(lastName)"
            }
            return name
        }
    }
}
