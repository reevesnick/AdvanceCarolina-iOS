//
//  NewsListTableViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 5/10/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import DZNEmptyDataSet

class NewsListTableViewController: PFQueryTableViewController,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "News"
        
        
        self.tableView.emptyDataSetSource = self;
        self.tableView.emptyDataSetDelegate = self;
        
        self.tableView.tableFooterView = UIView()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func queryForTable() -> PFQuery {
        let query:PFQuery = PFQuery(className:"News")
        
        if(objects?.count == 0)
        {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        
        query.orderByAscending("createdAt")
        
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
         let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! NewsTableViewCell
        
        cell.headlineTitleLabel?.text = object?.objectForKey("headline") as? String
        cell.headlineArticleLabel?.text = object?.objectForKey("article_description") as? String
        
        let imageFile = object?.objectForKey("headline_pic") as! PFFile
        cell.headlinePicure?.image = UIImage(named: "placeholder")
        cell.headlinePicure?.file = imageFile
        cell.headlinePicure.loadInBackground()
        
        return cell
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail"
        {
            let indexPath = self.tableView.indexPathForSelectedRow
            let detailVC = segue.destinationViewController as! NewsDetailViewController
            let object = self.objectAtIndexPath(indexPath)
            detailVC.titleString = object?.objectForKey("headline") as! String
            detailVC.articleString = object?.objectForKey("article_description") as! String
          //  detailVC.websiteString = object?.objectForKey("website") as! String
          //  detailVC.bioString = object?.objectForKey("candidate_bio") as! String
            
            detailVC.headlineFile = object?.objectForKey("headline_pic") as! PFFile
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
        }
        
    }


    
    
    // MARK: - DZEmptyView
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Unable to Load"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str,attributes: attrs);
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "It might have been a connect problems fronm the server or the internet connection is offline"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str,attributes: attrs);    }
    
    func backgroundColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.whiteColor()
        
    }
    
    
    // MARK: - DZEmptyView Delegate
    func emptyDataSetShouldDisplay(scrollView: UIScrollView!) -> Bool {
        return true;
    }
    
    func emptyDataSetShouldAllowTouch(scrollView: UIScrollView!) -> Bool {
        return true;
    }
    
    func emptyDataSetShouldAllowScroll(scrollView: UIScrollView!) -> Bool {
        return true;
    }
    
    func emptyDataSetDidTapView(scrollView: UIScrollView!) {
        //NSLog("", nil)
    }
    
    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
        // NSLog("", nil)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
