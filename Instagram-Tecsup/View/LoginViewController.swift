//
//  LoginViewController.swift
//  Instagram-Tecsup
//
//  Created by Linder Anderson Hassinger Solano    on 21/10/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.isSecureTextEntry = true
    }
    
    @IBAction func onTaplogin(_ sender: UIButton) {
        if txtEmail.text == "" || txtPassword.text == "" {
            let alert = UIAlertController(title: "Error", message: "Completa los campos", preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "ok", style: .default)
            alert.addAction(alertButton)
            present(alert, animated: true)
            return
        }
        
        signIn(email: txtEmail.text!, password: txtPassword.text!)
    }
    
    /// Vamos a crear 2 funciones una para el registro y para el sign
    /// si el ususario no existe llamo registro
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            // error es la variable donde si pasa un error esta tendra valor, si error no tiene un valor entendemos
            // que todo esta bien por ende error es igual nil
            if error == nil {
                /// El usuario existe
                
            } else {
                /// El usuario no existe
                self.signUp(email: email, password: password)
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                // vamos a crear alerta
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                // Agregango un boton
                let alertButton = UIAlertAction(title: "ok", style: .default)
                alert.addAction(alertButton)
            } else {
                // Se creo al usario
                
            }
        }
    }
    
}
