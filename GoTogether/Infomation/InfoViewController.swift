//
//  InfoViewController.swift
//  GoTogether
//
//  Created by pinkamon on 21/2/2561 BE.
//  Copyright © 2561 pinkamon. All rights reserved.
//

import UIKit
//import Firebase

class InfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var infotableview: UITableView!
    
    var provinces = ["Krabi(กระบี่)","Chumphon(ชุมพร)","Trang(ตรัง)","Nakron Si Trammarat(นครศรีธรรมราช)","Narathiwat(นราธิวาส)","Pattani(ปัตตานี)","Phangnga(พังงา)","Phatthalung(พัทลุง)","Phuket(ภูเก็ต)","Yala(ยะลา)","Ranong(ระนอง)","Songkhla(สงขลา)","Satun(สตูล)","Surat Thani(สุราษฏร์ธานี)"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provinces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        cell.textLabel?.text = provinces[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
