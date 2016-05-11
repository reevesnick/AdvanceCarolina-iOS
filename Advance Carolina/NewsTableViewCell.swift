//
//  NewsTableViewCell.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 5/10/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class NewsTableViewCell: PFTableViewCell {
    
    @IBOutlet weak var headlinePicure: PFImageView!
    @IBOutlet weak var headlineTitleLabel: UILabel!
    @IBOutlet weak var headlineArticleLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    var parseObject: PFObject?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
     override func layoutSubviews() {
        cardViewLayout()
    }
    
    func cardViewLayout(){
        self.cardView.layer.masksToBounds = false;
        self.cardView.layer.cornerRadius = 1; // if you like rounded corners
        self.cardView.layer.shadowOffset = CGSizeMake(-0.2, 0.2) //%%% this shadow will hang slightly down and to the right
        self.cardView.layer.shadowRadius = 1; //%%% I prefer thinner, subtler shadows, but you can play with this
        self.cardView.layer.shadowOpacity = 0.2; //%%% same thing with this, subtle is better for me
    }
    
    // Override func view
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
