//
//  createboardViewController.swift
//  GoTogether
//
//  Created by pinkamon on 11/23/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit
import Firebase

class createboardViewController: UIViewController {

    //outlet
    @IBOutlet weak var topicTextview: UITextView!
    @IBOutlet weak var captionTextview: UITextView!
    //var textViewPlaceholderText = "What's on your mind?"

    var databaseRef : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseRef = Database.database().reference(withPath: "Board")
        captionTextview.delegate = self as? UITextViewDelegate
        
    }
    //action
    @IBAction func savetoboardAction(_ sender: Any) {
        savetoboard()
    }
    //func
    func savetoboard() {
        let userID = Auth.auth().currentUser?.uid
        let key = databaseRef.child("Board").child(userID!).childByAutoId().key
        let post = ["key": key,
                    "topic": topicTextview.text! as String,
                    "caption": captionTextview.text! as String]
        self.databaseRef.child(key).setValue(post)
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
