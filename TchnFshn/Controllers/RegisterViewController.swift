//
//  RegisterViewController.swift
//  TchnFshn
//
//  Created by Nazik on 11.12.2020.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextLabel: UITextField!
    let RegisterToAccountSegue = "RegisterToAccount"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.backgroundColor = UIColor.white
        passwordTextLabel.backgroundColor = UIColor.white
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextLabel.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }else{
                    //navigate to tabbarVC
                    //self.performSegue(withIdentifier: self.RegisterToAccountSegue, sender: self)
                }
            }
        }
        
    }
    
    
}
