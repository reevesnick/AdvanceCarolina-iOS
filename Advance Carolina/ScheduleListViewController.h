//
//  ScheduleListViewController.h
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/18/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>


@interface ScheduleListViewController : UIViewController <UITableViewDataSource,UITabBarDelegate,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@property (weak,nonatomic)IBOutlet UITableView *tableView;

-(IBAction)createSchedule:(id)sender;
@end
