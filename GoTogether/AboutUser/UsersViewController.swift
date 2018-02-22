//
//  UsersViewController.swift
//  InstagramLike
//
//  Created by Vasil Nunev on 29/11/2016.
//  Copyright © 2016 Vasil Nunev. All rights reserved.
//

import UIKit
import Firebase

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableview: UITableView!
    
    var useritem = [Member]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference().child("Member")
       
        ref.observe(.value, with: {(snapshot) in
            if snapshot.childrenCount > 0{
                self.useritem.removeAll()
                
                for auser in snapshot.children.allObjects as![DataSnapshot]{
                    
                    let userObject = auser.value as? [String:AnyObject]
                    
                    let fullname = userObject?["fullname"] as? String ?? ""
                    let imagePath = userObject?["urlToImage"] as? String ?? ""
                    
                    let users = Member(fullname: fullname as String,imagePath: imagePath as String)
                    self.useritem.append(users)
                    
                    print(fullname)
                    print(imagePath)
                    print("------------")
                }
                self.tableview.reloadData()
                
            }
        })
        
//        retrieveUsers()
    }
//    func retrieveUsers() {
//        let ref = Database.database().reference()
//
//        ref.child("Member").queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
//        print(snapshot)
//        print("--------")
//            let users = snapshot.value as! [String : AnyObject]
//            self.useritem.removeAll()
//            for (_, value) in users {
//                if let uid = value["uid"] as? String {
//                    if uid != Auth.auth().currentUser!.uid {
//                        let userToShow = Member()
//                        if let fullname = value["full name"] as? String, let imagePath = value["urlToImage"] as? String {
//                            userToShow.fullname = fullname
//                            userToShow.imagePath = imagePath
//                            userToShow.userID = uid
//                            self.useritem.append(userToShow)
//                        }
//                    }
//                }
//            }
//            self.tableview.reloadData()
//        })
//        ref.removeAllObservers()
//
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        cell.nameLabel.text = self.useritem[indexPath.row].fullname
        cell.userID = self.useritem[indexPath.row].userID
        cell.userImage.downloadImage(from: self.useritem[indexPath.row].imagePath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useritem.count 
    }
}


extension UIImageView {
    
    func downloadImage(from imgURL: String) {
        let url = URLRequest(url: URL(string: imgURL)!)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    
//    if let profileImageURL = value!["urlToImage"] as? String
//    {
//        let url = URL(string: profileImageURL)
//        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//            if error != nil{
//                print(error!)
//                return
//            }
//            DispatchQueue.main.async {
//                self.profileimage?.image = UIImage(data: data!)
//            }
//        }).resume()
//    }
}











