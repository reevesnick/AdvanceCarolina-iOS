//
//  NewsDetailViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 5/10/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var headlinePictureFile: PFImageView!
    @IBOutlet weak var headlineTitleString: UILabel!
    @IBOutlet weak var headlineArticleString: UITextView!
    @IBOutlet weak var headlineCreatedDate: UILabel!
    @IBOutlet var scroller: UIScrollView!
    
    
    var headlineFile: PFFile!
    var titleString: String!
    var articleString: String!
    var createdString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]

        
        self.scroller.scrollEnabled = true
        self.scroller.contentSize = (CGSizeMake(320, 1000))

        
        self.headlinePictureFile.file = headlineFile;
        self.headlineTitleString.text = titleString;
        self.headlineArticleString.text = articleString;
        self.headlineCreatedDate.text = createdString;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
