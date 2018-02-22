//
//  SignupController.swift
//  GoTogether
//
//  Created by pinkamon on 11/19/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit
import Firebase


class SignupController: UIViewController {

    var ref : DatabaseReference!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func RegisterAction(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.txtEmail.text!, password: self.txtPassword.text!){(user,error) in
            if error == nil{
                self.ref = Database.database().reference(withPath: "Member")
                /*let memberData = member(name: self.txtName.text!, email:self.txtEmail.text!)
                let memberItemRef = self.ref.child(self.txtName.text!)
                memberItemRef.setValue(memberData.toAnyObject())*/
                
                let email = self.txtEmail.text
                let name = self.txtName.text
                
                let userID = Auth.auth().currentUser?.uid
                
                self.ref.child(userID!).setValue(["fullname": name , "email" : email, "uid": userID] )
                self.dismiss(animated: true, completion: nil)
            }
            else{
                let alert = UIAlertView(title:"Warning", message : "This email is already in use.",delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
