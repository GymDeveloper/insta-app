//
//  SettingsViewController.swift
//  Instagram-Tecsup
//
//  Created by Linder Anderson Hassinger Solano    on 14/10/22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
