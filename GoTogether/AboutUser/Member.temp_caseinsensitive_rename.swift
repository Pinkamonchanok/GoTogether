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
    let key : String
    var name : String!
    var userID : String!
    var email : String!
    var completed : Bool!
    let ref : DatabaseReference!
    init(name: String,email: String, key: String = "") {
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
    }
}

