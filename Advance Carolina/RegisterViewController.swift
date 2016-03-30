//
//  RegisterViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Foundation

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city:UITextField!
    @IBOutlet weak var county: UITextField!
    @IBOutlet weak var state:UITextField!
    @IBOutlet weak var party:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(sender: AnyObject){
        
    }
    
    @IBAction func submitData(sender: AnyObject){
        
        //Convert into a string 
        let firstNameText = firstName.text;
        let lastNameText = lastName.text;
        let addressText = address.text;
        let cityText = city.text;
        let countyText = county.text;
        let stateText = state.text;
        let partyText = party.text;
        
        
        let data = PFObject(className: "VoterInformation");
        data["first_name"] = firstNameText;
        data["last_name"] = lastNameText;
        data["address"] = addressText;
        data["city"] = cityText;
        data["county"] = countyText;
        data["state"] = stateText;
        data["party"] = partyText;
        
        data.saveInBackgroundWithBlock({
            (success: Bool, error: NSError?) -> Void in
                
            if (error == nil){
                if #available(iOS 8.0, *) {
                    let alert = UIAlertController(title: "Success!", message: "Thank you for proividing you voter infomation to Advance Carolina.", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                } else {
                    // Fallback on earlier versions
                    let button2Alert: UIAlertView = UIAlertView(title: "Success!", message: "Thank you for proividing you voter infomation to Advance Carolina.",
                        delegate: nil, cancelButtonTitle: "Ok")
                    button2Alert.show()
                }
        
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()! as UIViewController
                // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                
                self.presentViewController(viewController, animated: false, completion: nil)
                
                print("Data Uploaded");
            }
            else{
                if #available(iOS 8.0, *) {
                    let alert = UIAlertController(title: "Error", message: "Your Data cannot be uploaded. Please check your infomation and try again", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                } else {
                    // Fallback on earlier versions
                    let button2Alert: UIAlertView = UIAlertView(title: "Error", message: "Your Data cannot be uploaded. Please check your infomation and try again",
                        delegate: nil, cancelButtonTitle: "Ok")
                    button2Alert.show()
                }

                print("Your Data cannot be uploaded. Reason: ",error);
            }
        
    })
    
    
 
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
