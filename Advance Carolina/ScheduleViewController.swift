//
//  ScheduleViewController.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/14/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import Foundation


class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetDelegate,DZNEmptyDataSetSource{
    
    @IBOutlet weak var scheduleDate: UIDatePicker!
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - TableView Delegate & Data Source
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 0;
    }
    
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        return cell
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
