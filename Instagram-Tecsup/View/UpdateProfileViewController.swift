//
//  UpdateProfileViewController.swift
//  Instagram-Tecsup
//
//  Created by Linder Anderson Hassinger Solano    on 4/11/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class UpdateProfileViewController: UIViewController {
    
    var imagePicker = UIImagePickerController()
    
    var db = Firestore.firestore()
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtBio: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfile.layer.cornerRadius = 40
        imagePicker.delegate = self
        getUserData()
    }
    
    @IBAction func onBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onTapPhoto(_ sender: Any) {
        imagePicker.isEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true)
    }
    
    @IBAction func onTapSave(_ sender: Any) {
        uploadImage()
    }
    
    func getUserData() {
        let user = db.collection("users").document(Auth.auth().currentUser?.uid ?? "no-id")
        user.getDocument() { document, error in
            let data = document?.data()
            self.txtName.text = data!["name"] as? String
            self.txtBio.text = data!["bio"] as? String
            self.imageFromURL(address: data!["url_image"] as! String)
        }
    }
    
    func imageFromURL(address: String) {
        let url = URL(string: address)
        let data = try? Data(contentsOf: url!)

        if let imageData = data {
            imgProfile.contentMode = .scaleAspectFill
            imgProfile.image = UIImage(data: imageData)
        }
    }
    
//    func updateProfile(url: String) {
//
//    }
    
    func saveUser(url: String) {
        db.collection("users").document(Auth.auth().currentUser?.uid ?? "no-id").setData([
            "name": txtName.text!,
            "email": txtEmail.text!,
            "bio": txtBio.text!,
            "username": txtUsername.text!,
            "url_image": url
        ])
    }
    
}

extension UpdateProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage {
            imgProfile.contentMode = .scaleToFill
            imgProfile.image = pickedImage
        }
        
        imagePicker.dismiss(animated: true)
    }
    
    func uploadImage() {
        let storageRef = Storage.storage().reference().child("\(Auth.auth().currentUser?.uid ?? "").png")
        if let uploadData = self.imgProfile.image?.jpegData(compressionQuality: 0.5) {
            storageRef.putData(uploadData) { metadata, error in
                if error != nil {
                    print("error \(String(describing: error?.localizedDescription))")
                } else {
                    storageRef.downloadURL { url, error in
                        let imageURL = url?.absoluteString ?? ""
                        self.saveUser(url: imageURL)
                    }
                }
            }
        }
    }
    
}
