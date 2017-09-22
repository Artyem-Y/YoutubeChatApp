//
//  ViewController.swift
//  YoutubeChatApp
//
//  Created by Artem on 22.09.17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore

class ViewController: UIViewController {

    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        
    }

    @IBAction func registerButtonPressed(_ sender: Any) {
        
    }
    
    func login() {
        if usernameTxtField.text != "" && emailTxtField.text != "" && passwordTxtField.text != "" {
            Auth.auth().signIn(withEmail: self.emailTxtField.text!, password: self.passwordTxtField.text!, completion: {
                
                user, error in
                
                if error != nil {
                    print("Error")
                } else {
                    let databaseRef = Database.database().reference()
                    let uid = Auth.auth().currentUser?.uid
                    databaseRef.child("Users").child(uid!).observe(.value, with: {
                        
                        snapshot in
                        
                        if snapshot.childrenCount == 0 {
                            Helper.helper.switchToNavigationVC()
                        } else {
                            Helper.helper.switchToNavigationVC()
                        }
                        
                    })
                }
                
            })
        } else {
            // Do Something Later
        }
    }
    
    func register() {
        if usernameTxtField.text != "" && emailTxtField.text != "" && passwordTxtField.text != "" {
            Auth.auth().createUser(withEmail: emailTxtField.text!, password: passwordTxtField.text!, completion: {
                
                user, error in
                
                
                if error != nil {
                    print("Error")
                } else {
                    let uid = Auth.auth().currentUser?.uid
                    let databaseRef = Database.database().reference()
                    let userData : [String : Any] = ["email" : self.emailTxtField.text!,
                                                     "uid": uid!,
                                                     "username": self.usernameTxtField.text!]
                    databaseRef.child("Users").child(uid!).setValue(userData)
                    Helper.helper.switchToNavigationVC()
                    
                    
                }
                
            })
        }
    }

}

