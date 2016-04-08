//
//  PollingLocationViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/11/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import KINWebBrowser
import DZNEmptyDataSet
import FontAwesomeKit

class PollingLocationViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var pollTableView: UITableView!
    let disposeBag = DisposeBag()
    var pollViewModel: PollingLocationViewModel?
    var locations: [PollModel]? {
        didSet {
            print("Called reload \(locations?.count)")
            if let loc = locations {
                if loc.count > 0 {
                     self.pollTableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func registerToVote(sender: UIButton){
        
        let webBroswer = KINWebBrowserViewController()
        self.navigationController?.pushViewController(webBroswer, animated: true)
        webBroswer.loadURLString("http://www.google.com")  // USA Voting How to Page
    }
    
    @IBAction func registerToAdvancedCarolina(sender: UIButton){
        
        let viewController:UIViewController = UIStoryboard(name: "RegisterVoterInfo", bundle: nil).instantiateInitialViewController()! as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.presentViewController(viewController, animated: false, completion: nil)
    }
 /*
    deinit {
        self.pollTableView.emptyDataSetSource = nil
        self.pollTableView.emptyDataSetDelegate = nil
    }
  */  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pollViewModel = PollingLocationViewModel()
        
        
        pollViewModel?.getLocations("704 E Lindsay St, Greensboro")
            .subscribe {
                event -> Void in
                switch event {
                case .Completed:
                    print("Complete")
                case .Error(_):
                    print("Error")
                case .Next(let loc):
                    self.locations = loc
                }
        }.addDisposableTo(disposeBag)
        
        pollTableView.emptyDataSetDelegate = self
        pollTableView.emptyDataSetSource = self
        pollTableView.tableFooterView = UIView()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = locations?.count {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PollCell
        
        if let locationName = locations?[indexPath.row].locationName {
            cell.locationName.text = locationName
        }
        
        if let line1 = locations?[indexPath.row].line1 {
            cell.line1.text = line1
        } else {
            cell.line1.hidden = true
        }
        
        if let line2 = locations?[indexPath.row].line2 {
            cell.line2.text = line2
        } else {
            cell.line2.hidden = true
        }
        
        if let line3 = locations?[indexPath.row].line3 {
            cell.line3.text = line3
        } else {
            cell.line3.hidden = true
        }
        
        if let city = locations?[indexPath.row].city {
            cell.city.text = city
        }
        
        if let state = locations?[indexPath.row].state {
            cell.state.text = state
        }
        
        if let zip = locations?[indexPath.row].zip {
            cell.zip.text = zip
        }
        
        if let pollHours = locations?[indexPath.row].pollingHours {
            cell.pollHours.text = pollHours
        }
        
        return cell
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

extension PollingLocationViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    // MARK: EmptyDataSet Methods
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "No polling locations available"
        
        let attributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0),
            NSForegroundColorAttributeName: UIColor.blackColor()
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "We are not able to find any polling locations."
        
        let paragraph = NSMutableParagraphStyle()
        
        paragraph.lineBreakMode = .ByWordWrapping
        paragraph.alignment = .Center
        
        let attributes = [
            NSFontAttributeName: UIFont.systemFontOfSize(14.0),
            NSForegroundColorAttributeName: UIColor.blackColor(),
            NSParagraphStyleAttributeName: paragraph
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        let attributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(17.0),
            NSForegroundColorAttributeName: UIColor.blueColor()
        ]
        
        return NSAttributedString(string: "Search for new location", attributes:attributes)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return FAKFontAwesome.homeIconWithSize(50).imageWithSize(CGSize(width: 50, height: 50))
    }
    
    func backgroundColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor.whiteColor()
    }
    
    //    func customViewForEmptyDataSet(scrollView: UIScrollView!) -> UIView! {
    //        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    //        activityView.startAnimating()
    //        return activityView
    //    }
    
    // MARK: - DZNEmptyDataSetDelegate
    
    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
        print("Button pressed")
    }
    
}
