//
//  ViewController.swift
//  GoTogether
//
//  Created by pinkamon on 9/19/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LogoutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil{
            do{
                try? Auth.auth().signOut()
                
                if Auth.auth().currentUser == nil {
                    let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")as! loginController
                    self.present(loginVC, animated: true, completion: nil)
                }
            }
        }
    }
}

