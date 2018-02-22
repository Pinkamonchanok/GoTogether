//
//  showTableViewCell.swift
//  GoTogether
//
//  Created by pinkamon on 12/9/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit

class showTableViewCell: UITableViewCell {
    
    //var myView = content!.self

    @IBOutlet weak var lbtitle: UILabel!
    @IBOutlet weak var textviewshow: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
