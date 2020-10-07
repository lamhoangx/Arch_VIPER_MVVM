//
//  ContactsTableViewCell.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import UIKit

class MVVMContactsTableViewCell: UITableViewCell {
    var cellModel: MVVMContactViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    func bindViewModel() {
        textLabel?.text = cellModel?.fullName
    }
}
