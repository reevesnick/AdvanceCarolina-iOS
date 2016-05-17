//
//  TabBarController.swift
//  Advance Carolina
//
//  Created by Jamone Alexander Kelly on 3/16/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import FontAwesomeKit

class TabBarController: UITabBarController {
    
    // MARK: Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabs: [UITabBarItem] = self.tabBar.items {
            let poll: UITabBarItem = tabs[0] as UITabBarItem
            let ballot: UITabBarItem = tabs[1] as UITabBarItem
            let candidates: UITabBarItem = tabs[2] as UITabBarItem
            let news: UITabBarItem = tabs[3] as UITabBarItem
            let contact: UITabBarItem = tabs[4] as UITabBarItem
            
            poll.image = UIImage(named:"RSS-30")
            ballot.image = UIImage(named:"Clipboard-30")
            candidates.image = UIImage(named:"User Groups-30")
            news.image = UIImage(named:"Box-30")
            contact.image = UIImage(named:"Message-30")
            
            //poll.image = FAKFontAwesome.pieChartIconWithSize(28).imageWithSize(CGSize(width: 28, height: 28))
            //ballot.image = FAKFontAwesome.fileOIconWithSize(28).imageWithSize(CGSize(width: 28, height: 28))
            //candidates.image = FAKFontAwesome.usersIconWithSize(28).imageWithSize(CGSize(width: 28, height: 28))
            //news.image = FAKFontAwesome.newspaperOIconWithSize(28).imageWithSize(CGSize(width: 28, height: 28))
            //contact.image = FAKFontAwesome.envelopeIconWithSize(28).imageWithSize(CGSize(width: 28, height: 28))
        }
    }
}
