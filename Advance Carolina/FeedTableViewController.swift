//
//  FeedTableViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/8/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import MWFeedParser
import KINWebBrowser

extension String {
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = dataUsingEncoding(NSUTF8StringEncoding)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}


class FeedTableViewController: UITableViewController, MWFeedParserDelegate, KINWebBrowserDelegate, DZNEmptyDataSetDelegate,DZNEmptyDataSetSource {
    
    
    var feedItems = [MWFeedItem]()
    
    func request(){
        let url = NSURL(string: "http://feeds.feedburner.com/realclearpolitics/qlMj");
        let feedParser = MWFeedParser(feedURL: url)
        feedParser.delegate = self
        feedParser.parse()

    }
    
    // 

    // MARK: - Feed Parser Delegate
    func feedParserDidStart(parser: MWFeedParser!) {
        feedItems = [MWFeedItem]()
    }
    
    func feedParserDidFinish(parser: MWFeedParser!) {
        self.tableView.reloadData();
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedInfo info: MWFeedInfo!) {
        print(info);
        self.title = "News";
        //self.summary = info.summary;
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        feedItems.append(item)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]


        
        // Set DZEmptyVieDataSet Delegate and Datasource
        self.tableView.emptyDataSetDelegate = self;
        self.tableView.emptyDataSetSource = self;
        
        self.tableView.tableFooterView = UIView()
    }
    
    deinit{
        self.tableView.emptyDataSetSource = nil;
        self.tableView.emptyDataSetDelegate = nil;
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        request()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100;
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        
        
        

        let item = feedItems[indexPath.row] as MWFeedItem
        var DateStringer = item.date;
        //Convert Date Into String
        var formatter = NSDateFormatter()
        formatter.dateFormat = "M/dd/yyyy, H:mm"
        var dateString = formatter.stringFromDate(item.date)
        
        let subtitle = NSMutableString()
        if ((item.date) != nil){
            subtitle.appendFormat("%@ ", formatter.stringFromDate(item.date));
        }
        subtitle.appendString(item.summary.html2String)
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = subtitle as String;
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = feedItems[indexPath.row] as MWFeedItem
        
        let webBroswer = KINWebBrowserViewController()
        let url = NSURL(string: item.link)
        
        webBroswer.loadURL(url);
        
        self.navigationController?.pushViewController(webBroswer, animated: true);
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
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
