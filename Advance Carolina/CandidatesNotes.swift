//
//  CandidatesNotes.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 4/6/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import MBProgressHUD


class CandidatesNotes: UIViewController, UITextViewDelegate {

    @IBOutlet weak var candidateNotes: UITextView!
    
    @IBAction func doneButtonClicked(sender: AnyObject){
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.presentViewController(viewController, animated: false, completion: nil)
        
    }

    
    @IBAction func saveButtonClick(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let loadingBar = MBProgressHUD.showHUDAddedTo(self.view, animated:true)
        loadingBar.labelText = "Saving Notes";

        
        defaults.setObject(candidateNotes.text, forKey: "notes")
        defaults.synchronize()
        
        
        loadingBar.hide(true);
        print("notes=\(candidateNotes.text)")
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
       //self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]

    
        
        
        if NSUserDefaults.standardUserDefaults().objectForKey("notes") != nil {
            candidateNotes.text = NSUserDefaults.standardUserDefaults().objectForKey("notes") as! String
        } else {
            // No Else
        }

    
    
}
}