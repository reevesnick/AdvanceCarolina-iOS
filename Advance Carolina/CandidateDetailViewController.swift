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
    
    @IBOutlet weak var candidateBio: UITextView!
    

    
  
    var nameString: String!
    var partyString: String!
    var websiteString:String!
    var bioString: String!

    var pictureFile: PFFile!
    

    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()


        // Do any additional setup after loading the view.
        
        self.candidateNameString.text = nameString;
        self.candidatePartyString.text = partyString;
        self.candidatePictureFile.file = pictureFile
        self.candidateWebsite.text = websiteString
        self.candidateBio.text = bioString

        
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
 
