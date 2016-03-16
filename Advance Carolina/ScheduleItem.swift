//
//  ScheduleItem.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/15/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

struct ScheduleItem {
    var title:String!
    var deadline:NSDate!
    var UUID:String!
   
    
    init(deadline: NSDate, title: String, UUID: String) {
        self.deadline = deadline
        self.title = title
        self.UUID = UUID
    }
    
    var isOverdue: Bool {
        return (NSDate().compare(self.deadline) == NSComparisonResult.OrderedDescending) // deadline is earlier than current date
    }
    
}