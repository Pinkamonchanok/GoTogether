//
//  boardViewController.swift
//  GoTogether
//
//  Created by pinkamon on 11/24/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit
import Firebase

class boardViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataitem = [board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference().child("Board")
        
        ref.observe(.value, with: {(snapshot) in
            if snapshot.childrenCount > 0{
                self.dataitem.removeAll()
                
                for aboard in snapshot.children.allObjects as![DataSnapshot]{
                    
                    let boardObject = aboard.value as? [String:AnyObject]
                    
                     let topic = boardObject?["topic"] as? String ?? ""
                     let caption = boardObject?["caption"] as? String ?? ""
                    
                    let boards = board(topic: topic as String?,caption: caption as String?)
                    self.dataitem.append(boards)
                    print(topic)
                    print("------------")
                }
                self.tableView.reloadData()
                
            }
        })
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataitem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myView = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! showTableViewCell
        let boards: board
        boards = dataitem[indexPath.row]

        myView.lbtitle.text = boards.topic
        myView.textviewshow.text = boards.caption
        return myView
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
