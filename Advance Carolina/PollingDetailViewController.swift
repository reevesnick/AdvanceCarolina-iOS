//
//  PollingDetailViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 4/13/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import KINWebBrowser

class PollingDetailViewController: UIViewController {
    
    @IBOutlet weak var locationNameLabel:UITextView!
    @IBOutlet weak var lineOneLabel: UITextView!
    @IBOutlet weak var lineTwoLabel: UITextView!
    @IBOutlet weak var lineThreeLabel: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
