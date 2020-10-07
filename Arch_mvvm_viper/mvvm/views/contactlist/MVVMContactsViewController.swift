//
//  ContactsViewController.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import UIKit

class MVVMContactsViewController: UIViewController, UITableViewDataSource {
    let contactViewModelController = MVVMContactViewModelController()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func presentAddContactScreen(_ sender: Any) {
        let sb = UIStoryboard(name: "MVVMContacts", bundle: nil)
        let view = sb.instantiateViewController(identifier: "ADD_CONTACT_MVVM")
        if let addContactScreen = view as? MVVMAddContactViewController {
            addContactScreen.contactViewModelController = contactViewModelController
            addContactScreen.didAddContact = { [self] (contactViewModel, index) in
                let indexPath = IndexPath(row: index, section: 0)
                tableView.beginUpdates()
                tableView.insertRows(at: [indexPath], with: .middle)
                tableView.endUpdates()
            }
            
            present(addContactScreen, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
        contactViewModelController.retrieveContacts({[self] in
            tableView.reloadData()
        }, failure: nil)
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MVVMContactCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = contactViewModelController.getContactViewModel(at: indexPath.row).fullName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactViewModelController.contactsCount
    }
}
