//
//  MVVMAddContactViewController.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import UIKit

class MVVMAddContactViewController: UIViewController {
    
    weak var contactViewModelController: MVVMContactViewModelController?
    var didAddContact: ((ContactModel, Int) -> Void)?
    
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    
    @IBAction func onCancelClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onDoneClick(_ sender: Any) {
        guard let firstName = inputFirstName.text,
              let lastName = inputLastName.text
        else {
            return
        }
        
        if firstName.isEmpty || lastName.isEmpty {
            showAlert(title: "Error", message: "A contact must have first and last names")
            return
        }
        
        dismiss(animated: true, completion: { [self] in
            contactViewModelController?.createContact(
                firstName: firstName,
                lastName: lastName,
                success: didAddContact,
                failure: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        inputFirstName.becomeFirstResponder()
    }
}
