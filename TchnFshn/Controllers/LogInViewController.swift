//
//  LogInViewController.swift
//  TchnFshn
//
//  Created by Nazik on 11.12.2020.
//

import UIKit
import Firebase
class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let LogInToAccountSegue = "LogInToAccount"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFiled.backgroundColor = UIColor.white
        passwordTextField.backgroundColor = UIColor.white
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        if let email = emailTextFiled.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    //self.performSegue(withIdentifier: self.LogInToAccountSegue, sender: self)
                }
            }
        }
        
    }
    
}
