//
//  loginController.swift
//  GoTogether
//
//  Created by pinkamon on 9/27/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit
import Firebase

class loginController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func LoginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!, completion: {(user, error) in
            if error != nil{
                let alert = UIAlertView(title:"Warning!",message : "You are not member",delegate: nil,cancelButtonTitle:"OK")
                alert.show()
            }
            else{
                let mView = self.storyboard?.instantiateViewController(withIdentifier: "NavigationView") as!
                UINavigationController
                self.present(mView,animated: true,completion: nil)
                let alert = UIAlertView(title: "Success", message: "Login Success !!",delegate: nil,cancelButtonTitle:"OK")
                alert.show()
            }
        })
    }
    
    @IBAction func ForgetpassAction(_ sender: Any) {
        var email = ""
        let alert = UIAlertController(title: title,message:"Forget Password", preferredStyle:.alert)
        
        alert.addTextField(configurationHandler:  { (txtField) -> Void in            txtField.placeholder = "Enter your email."
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            email = textField.text!
            self.forgetPass(email:email)
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    func forgetPass(email : String){
        Auth.auth().sendPasswordReset(withEmail: email){ (error) in
            if error != nil{
                let alert = UIAlertView(title:"Fail",message:"Invalid your email",delegate:nil,cancelButtonTitle:"OK")
                alert.show()
            }
            else{
                let alert = UIAlertView(title:"Success", message:"Please check your email",delegate:nil,cancelButtonTitle:"OK")
                alert.show()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textfield: UITextField) -> Bool{
        textfield.resignFirstResponder()
        
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


