//
//  profileViewController.swift
//  GoTogether
//
//  Created by pinkamon on 11/22/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit
import Firebase

class profileViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    //variable
    let storageRef = Storage.storage().reference()
    let databaseRef = Database.database().reference()
    
    //outlet
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var usernameTxt: UILabel!
    
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage.layer.cornerRadius = profileimage.frame.size.width/2
        profileimage.clipsToBounds = true
        
        setupProfile()
    }
    
    //action
    @IBAction func saveChanges(_ sender: Any) {
        saveChanges()
        
    }
    @IBAction func uploadImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    //function
    
    func setupProfile(){
        profileimage.layer.cornerRadius = profileimage.frame.size.width/2
        profileimage.clipsToBounds = true
        let userID = Auth.auth().currentUser?.uid
        databaseRef.child("Member").child(userID!).observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            let usernameshow = value?["fullname"] as? String ?? ""
            self.usernameTxt.text = usernameshow
            
                    if let profileImageURL = value!["urlToImage"] as? String
                    {
                        let url = URL(string: profileImageURL)
                        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                            if error != nil{
                                print(error!)
                                return
                            }
                            DispatchQueue.main.async {
                                self.profileimage?.image = UIImage(data: data!)
                            }
                        }).resume()
                    }
                
            })
            
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        }else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker{
            profileimage.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func saveChanges(){
        
        let imageName = NSUUID().uuidString
        
        let storedImage = storageRef.child("profileimages").child(imageName + ".jpg")
        
        if let uploadData = UIImagePNGRepresentation(self.profileimage.image!)
        {
            storedImage.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                if error != nil{
                    print(error!)
                    return
                }
                storedImage.downloadURL(completion: { (url, error) in
                    if error != nil{
                        print(error!)
                        return
                    }
                    if let urlText = url?.absoluteString{
                        self.databaseRef.child("Member").child((Auth.auth().currentUser?.uid)!).updateChildValues(["urlToImage" : urlText], withCompletionBlock: { (error, ref) in
                            if error != nil{
                                print(error!)
                                return
                            }
                        })
                        
                    }
                })
            })
        }
        
        //alert success when click save
        let alert = UIAlertView(title: "Success", message: "Success !!",delegate: nil,cancelButtonTitle:"OK")
        alert.show()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
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
