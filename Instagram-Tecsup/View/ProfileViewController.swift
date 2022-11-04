//
//  ProfileViewController.swift
//  Instagram-Tecsup
//
//  Created by Linder Anderson Hassinger Solano    on 28/10/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnContact: UIButton!
    @IBOutlet weak var btnStatics: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.layer.cornerRadius = 30
        btnEdit.layer.cornerRadius = 13
        btnContact.layer.cornerRadius = 13
        btnStatics.layer.cornerRadius = 13
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
