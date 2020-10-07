//
//  ContactViewModel.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import Foundation

public struct MVVMContactViewModel {
    var fullName: String
}

public func <(lhs: MVVMContactViewModel, rhs: MVVMContactViewModel) -> Bool {
    return lhs.fullName.lowercased() < rhs.fullName.lowercased()
}

public func >(lhs: MVVMContactViewModel, rhs: MVVMContactViewModel) -> Bool {
    return lhs.fullName.lowercased() > rhs.fullName.lowercased()
}
