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
    
    var introModalDidDisplay = false

    
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

        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, forState: .Selected)
        

        // Do any additional setup after loading the view.
        
       // self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
       // self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()


    }
/*
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showRegisterInfo()

        
    }
    
    func showRegisterInfo(){
        
        let launchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        }
        else {
            print("First launch, setting NSUserDefault.")
            let viewController:UIViewController = UIStoryboard(name: "RegisterVoterInfo", bundle: nil).instantiateInitialViewController()! as UIViewController
            self.presentViewController(viewController, animated: false, completion: nil)
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "launchedBefore")
        }
        
       
        
        
    }
  */  
    
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
