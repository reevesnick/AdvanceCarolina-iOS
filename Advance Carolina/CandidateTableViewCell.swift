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
    
    
    
    
    var parseObject:PFObject?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   /// override func view
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
