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
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]


        // Do any additional setup after loading the view.
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
    
        mailComposerVC.setToRecipients(["someone@somewhere.com"]) //Mail to
        mailComposerVC.setSubject("Sending you an in-app e-mail...") // Subject
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
