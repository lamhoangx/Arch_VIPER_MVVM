//
//  AddContactView.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/5/20.
//

import Foundation
import UIKit

class VIPERAddContactView: UIViewController, AddContactViewProtocol {
    weak var presenter: AddContactPresenterProtocol?
    
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputFirstName.becomeFirstResponder()
    }
    
    @IBAction func onCancelClick(_ sender: Any) {
        presenter?.cancelAddContact()
    }
    
    @IBAction func onDoneClick(_ sender: Any) {
        guard
            let firstName = inputFirstName.text,
            let lastName = inputLastName.text
        else {
            return
        }
        
        if firstName.isEmpty || lastName.isEmpty {
            showAlert(title: "Error", message: "A contact must have first and last names")
            return
        }
        presenter?.addNewContact(firstName: firstName, lastName: lastName)
    }
}

extension VIPERAddContactView: AddContactPresenterDelegate {
    func didAddContact(_ contact: ContactModel) {
        
    }
    
    func didCancelAddContact() {
        
    }
}
