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
import MBProgressHUD

class PollingLocationViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: Properties
    @IBOutlet weak var searchBar: UISearchBar!
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
                else if loc.count == 0{
                    let loadingBar = MBProgressHUD.showHUDAddedTo(self.view, animated:true)
                    
                }
            }
        }
    }
  
    @IBAction func getDirections(sender: UIButton){
        
        let webBroswer = KINWebBrowserViewController()
       //let stringAddress = locations.
        self.navigationController?.pushViewController(webBroswer, animated: true)
        webBroswer.loadURLString("maps://maps.apple.com/?q=")  // USA Voting How to Page
 

    
    }
    
    @IBAction func registerToVote(sender: UIButton){
        
        let webBroswer = KINWebBrowserViewController()
        self.navigationController?.pushViewController(webBroswer, animated: true)
        webBroswer.loadURLString("https://www.usa.gov/register-to-vote")  // USA Voting How to Page
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let text = searchBar.text {
            let loadingBar = MBProgressHUD.showHUDAddedTo(self.view, animated:true)
            if !text.isEmpty {
                pollViewModel?.getLocations(text)
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
            }
            loadingBar.hide(true)

        }
    }
    

 /*
    deinit {
        self.pollTableView.emptyDataSetSource = nil
        self.pollTableView.emptyDataSetDelegate = nil
    }
  */  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        

        
        pollViewModel = PollingLocationViewModel()
        
    /*
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
       */
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
        
        cell.accessoryType = .DetailDisclosureButton

        
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
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
      
        let webBroswer = KINWebBrowserViewController()
        let stringAddress = locations?[indexPath.row].line1
        var stringAddressTest: String = String(format: "%d", (locations?[indexPath.row].line1)!)
        self.navigationController?.pushViewController(webBroswer, animated: true)
        webBroswer.loadURLString("http://maps.apple.com/?q=\(locations?[indexPath.row].line1)")  // USA Voting How to Page
 
 
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let indexPath = self.pollTableView.indexPathForSelectedRow
            let detailVC = segue.destinationViewController as! PollingDetailViewController
        }
    }
   */

}
 

extension PollingLocationViewController: DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    // MARK: EmptyDataSet Methods
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "No polling locations"
        
        let attributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0),
            NSForegroundColorAttributeName: UIColor.blackColor()
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "You can search for you locations by typing your location in the search bar above."
        
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
 /*
    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
        let attributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(17.0),
            NSForegroundColorAttributeName: UIColor.blueColor()
        ]
        
        return NSAttributedString(string: "Search for new location", attributes:attributes)
    }
    */
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
