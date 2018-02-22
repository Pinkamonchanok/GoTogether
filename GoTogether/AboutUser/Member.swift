//
//  member.swift
//  GoTogether
//
//  Created by pinkamon on 11/19/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import Foundation
import Firebase

class Member : NSObject{
    var imagePath : String
    var userID : String!
    var fullname : String
    let key : String = ""
    var email : String!
    var completed : Bool!
    let ref : DatabaseReference! = nil
    init(fullname:String? , imagePath:String?) {
        self.fullname = fullname!;
        self.imagePath = imagePath!;
    }
    /*init(name: String,email: String, key: String = "") {
        self.key = key
        self.name = name
        self.email = email
        self.ref = nil
    }
    init(snapshot : DataSnapshot){
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String:AnyObject]
        name = snapshotValue["name"] as! String
        email = snapshotValue["email"] as! String
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return["name":name,"email":email]
    }*/
}

