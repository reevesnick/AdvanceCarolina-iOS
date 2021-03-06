//
//  ContactViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/8/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ContactViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    @IBOutlet var textview:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
      //  self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        self.title = "Contact Us";



        // Do any additional setup after loading the view.
    }

    @IBAction func registerToAdvancedCarolina(sender: UIButton){
        
        let viewController:UIViewController = UIStoryboard(name: "RegisterVoterInfo", bundle: nil).instantiateInitialViewController()! as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.presentViewController(viewController, animated: false, completion: nil)
    }
    
    
    @IBAction func sendEmailButtonTapped(sender: AnyObject){
        let mailComposeViewControlller = configuredMailComposeViewController();
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewControlller, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
        mailComposerVC.setToRecipients(["info@advancecarolina.com"]) //Mail to
        mailComposerVC.setSubject("AdvanceUS Contact") // Subject
        //mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
    
        return mailComposerVC
    }
    
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
  /*
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        
    }
   */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
