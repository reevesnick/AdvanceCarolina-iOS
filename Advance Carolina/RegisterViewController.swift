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
    @IBOutlet weak var lastname: UITextField!
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
    
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
