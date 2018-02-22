//
//  board.swift
//  GoTogether
//
//  Created by pinkamon on 11/23/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import Foundation
import Firebase

class board{
    //let key : String?
    let topic : String?
    let caption : String?
    
    init(/*key: String?,*/topic: String?,caption: String?) {
        //self.key = key;
        self.topic = topic;
        self.caption = caption;
    }
}






/*class content{

    let key : String
    var topic : String!
    var caption : String!
    var completed : Bool!
    let ref : DatabaseReference!
    init(topic: String,caption: String, key: String = "") {
     
        self.key = key
        self.topic = topic
        self.caption = caption
        self.ref = nil
    }
    init(snapshot : DataSnapshot){
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String:AnyObject]
      
        topic = snapshotValue["topic"] as! String
        caption = snapshotValue["caption"] as! String
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return["topic":topic,"caption":caption]
    }
}*/

