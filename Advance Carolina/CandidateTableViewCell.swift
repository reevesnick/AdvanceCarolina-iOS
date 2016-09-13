//
//  CandidateTableViewCell.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/29/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class CandidateTableViewCell: PFTableViewCell {
    
    @IBOutlet weak var candidateNameLabel: UILabel!
    @IBOutlet weak var candidatePartyLabel: UILabel!
    @IBOutlet weak var candidiatePicture: PFImageView!
    @IBOutlet weak var candidateOfficeLabel: UILabel!
    
    
    
    
    var parseObject:PFObject?

    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        let cstatus = parseObject?.objectForKey("primary") as? Bool
        if (cstatus == true){
            candidateStatus!.hidden = false
        }
        else {
            candidateStatus!.hidden = true
        }
        */
        
        candidiatePicture.layer.cornerRadius = candidiatePicture.frame.size.width/2
        candidiatePicture.clipsToBounds = true;
        
    }
    

    
   /// override func view
    /*
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
*/
}
