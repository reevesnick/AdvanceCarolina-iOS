//
//  CreateScheduleViewController.h
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/18/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateScheduleViewController : UIViewController <UITextFieldDelegate>

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *itemText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
