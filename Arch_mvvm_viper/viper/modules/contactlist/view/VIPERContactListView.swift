//
//  VIPERContactListView.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/4/20.
//

import Foundation
import UIKit

class VIPERContactListView: UIViewController, ContactListViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    weak var presenter: ContactListPresenterProtocol?
    var contactList: [ContactViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.dataSource = self
    }

    @IBAction func openAddContactScreen(_ sender: Any) {
        presenter?.presentAddContact(from: self)
    }
}

extension VIPERContactListView: ContactListPresenterDelegate {

    func reloadInterface(with contacts: [ContactViewModel]) {
        contactList = contacts
        tableView.reloadData()
    }

    func didInsertContact(_ contact: ContactViewModel) {
        let insertionIndex = contactList.insertionIndex(of: contact) { $0.fullName < $1.fullName }
        contactList.insert(contact, at: insertionIndex)

        let indexPath = IndexPath(row: insertionIndex, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .middle)
        tableView.endUpdates()
    }
}

extension VIPERContactListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VIPERContactCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = contactList[indexPath.row].fullName
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
}
