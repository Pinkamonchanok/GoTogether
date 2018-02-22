//
//  imagescrollViewController.swift
//  GoTogether
//
//  Created by pinkamon on 9/22/2560 BE.
//  Copyright © 2560 pinkamon. All rights reserved.
//

import UIKit

class imagescrollViewController: UIViewController {

    @IBOutlet weak var mainscrollView: UIScrollView!
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mainscrollView.frame = view.frame
        
        imageArray = [#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2")]
        
        for i in 0..<imageArray.count{
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainscrollView.frame.width, height:self.mainscrollView.frame.height )
            
            mainscrollView.contentSize.width = mainscrollView.frame.width * CGFloat(i+1)
            mainscrollView.addSubview(imageView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
