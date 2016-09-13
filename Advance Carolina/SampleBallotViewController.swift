//
//  SampleBallotViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/8/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Foundation
import DZNEmptyDataSet


class SampleBallotViewController: UIViewController, UITableViewDelegate, DZNEmptyDataSetSource,DZNEmptyDataSetDelegate  {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
      //  self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]


        
        self.tableView.emptyDataSetSource = self;
        self.tableView.emptyDataSetDelegate = self;
        
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
      /*
        let localfilePath = NSBundle.mainBundle().URLForResource("5098201883794.preview-620",withExtension: "jpg");
        let myRequest = NSURLRequest(URL: localfilePath!);
        webView.loadRequest(myRequest);
        
        //Zoom in aod out web view
        let contentSize:CGSize = webView.scrollView.contentSize
        let viewSize:CGSize = self.view.bounds.size
        
        let rw = viewSize.width / contentSize.width;
        
        webView.scrollView.minimumZoomScale = rw;
        webView.scrollView.zoomScale = rw;
        
        
        */
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PollCell
        
        
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DZEmptyView
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Sample Ballot coming soon."
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str,attributes: attrs);
    }
   /*
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "It might have been a connect problems from the server or the internet connection is offline. "
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str,attributes: attrs);    }
    */
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
        NSLog("");
    }
    
    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
        // NSLog("", nil)
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
