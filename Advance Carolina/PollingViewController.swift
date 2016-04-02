//
//  PollingViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/11/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Foundation

class PollingViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            view1.hidden = false
            view2.hidden = true
        case 1:
            view1.hidden = true
            view2.hidden = false
        default:
            break;
        }
    }
    
    
    @IBAction func addSchedule(sender: UIBarButtonItem){
        
        
        let viewController:UIViewController = UIStoryboard(name: "CreateScheduleStoryboard", bundle: nil).instantiateInitialViewController()! as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.presentViewController(viewController, animated: false, completion: nil)
 
 
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]

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
