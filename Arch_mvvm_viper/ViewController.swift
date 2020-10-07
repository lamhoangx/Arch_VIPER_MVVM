//
//  ViewController.swift
//  Arch_mvvm_viper
//
//  Created by LamHX on 10/2/20.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startMVVM(_ sender: Any) {
        let sb = UIStoryboard(name: "MVVMContacts", bundle: nil)
        let mvvmVC = sb.instantiateViewController(identifier: "MAIN_MVVM")
        navigationController?.pushViewController(mvvmVC, animated: true)
    }
    
    @IBAction func startVIPER(_ sender: Any) {
        let viperContact = VIPERContactListRouter.createContactListModule()
        navigationController?.pushViewController(viperContact, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

