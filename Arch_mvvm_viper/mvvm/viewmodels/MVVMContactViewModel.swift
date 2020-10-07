//
//  MVVMContactViewModel.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import Foundation

public class MVVMContactViewModel {
    var contactModel: MVVMContactModel
    
    init(contactModel: MVVMContactModel) {
        self.contactModel = contactModel
    }
    
    var fullName: String {
        get {
            return contactModel.fullName
        }
    }
}

public func < (lhs: MVVMContactViewModel, rhs: MVVMContactViewModel) -> Bool {
    return lhs.fullName.lowercased() < rhs.fullName.lowercased()
}

public func > (lhs: MVVMContactViewModel, rhs: MVVMContactViewModel) -> Bool {
    return lhs.fullName.lowercased() > rhs.fullName.lowercased()
}

