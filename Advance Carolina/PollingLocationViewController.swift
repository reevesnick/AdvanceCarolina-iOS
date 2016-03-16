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

class PollingLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: Properties
    @IBOutlet weak var pollTableView: UITableView!
    let disposeBag = DisposeBag()
    var pollViewModel: PollingLocationViewModel?
    var locations: [PollModel]? {
        didSet {
            print("Called reload \(locations?.count)")
            
            self.pollTableView.reloadData()
        }
    }
    
    @IBAction func registerToVote(sender: UIButton){
        
        let webBroswer = KINWebBrowserViewController()
        self.navigationController?.pushViewController(webBroswer, animated: true)
        webBroswer.loadURLString("http://www.google.com")  // USA Voting How to Page
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pollViewModel = PollingLocationViewModel()
        
        
        pollViewModel?.getLocations("9 white oak circle, Salisbury, NC 28146")
            .subscribe {
                event -> Void in
                switch event {
                case .Completed:
                    print("Complete")
                case .Error(_):
                    print("Error")
                case .Next(let loc):
                    debugPrint(loc)
                    self.locations = loc
                }
        }.addDisposableTo(disposeBag)
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PollCell
        
        cell.locationName.text = locations![indexPath.row].locationName
        
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
