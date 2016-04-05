//
//  CandidateDetailViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/30/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class CandidateDetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var candidateNameString: UILabel!
    @IBOutlet weak var candidatePartyString: UILabel!
    @IBOutlet  var candidatePictureFile: PFImageView!
    @IBOutlet weak var candidateWebsite: UITextView!
    
    @IBOutlet weak var candidateNotes: UITextView!
    

    
  
    var nameString: String!
    var partyString: String!
    var websiteString:String!

    var pictureFile: PFFile!
    
    @IBAction func saveButtonClick(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(candidateNotes.text, forKey: "notes")
        defaults.synchronize()
        
        print("notes=\(candidateNotes.text)")

    }
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.candidateNameString.text = nameString;
        self.candidatePartyString.text = partyString;
        self.candidatePictureFile.file = pictureFile
        self.candidateWebsite.text = websiteString
        
        
        
        
        

        
        candidatePictureFile.layer.cornerRadius = candidatePictureFile.frame.size.width/2
        candidatePictureFile.clipsToBounds = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    

}
 
