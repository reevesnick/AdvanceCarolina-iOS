//
//  CustomSegmentControl.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 4/20/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import Foundation
import UIKit

/*
extension SequenceType {
    func enumerate() -> EnumerateSequence<Self>
}
*/
@IBDesignable class CustomSegmentControl: UIControl{
    private var labels = [UILabel]()
    var thumbView = UIView()
    
    var items:[String] = ["Polling Locations","Schedule Vote"]{
        didSet{
            setupLabels()
        }
    }
    
    var selectedIndex: Int = 0{
        didSet{
            displayNewSelectedIndex()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
        setupView()
    }
    
    func setupView(){
        layer.cornerRadius = frame.height/2
        layer.borderColor = UIColor(white: 1.0, alpha: 0.5).CGColor
        layer.borderWidth = 2
        
        backgroundColor = UIColor.grayColor()
        
        setupLabels()
        
        insertSubview(thumbView, atIndex: 0)
    }
    
    func setupLabels(){
        for label in labels{
            label.removeFromSuperview()
        }
        labels.removeAll(keepCapacity: true)
        
        for index in 1...items.count{
            let label = UILabel(frame: CGRectZero)
            label.text = items[index - 1]
            label.textAlignment = .Center
            label.textColor = UIColor(white: 0.5, alpha: 1)
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selectFrame = self.bounds
        let newWidth = CGRectGetWidth(selectFrame) / CGFloat(items.count)
        selectFrame.size.width = newWidth
        thumbView.frame = selectFrame
        thumbView.backgroundColor = UIColor.whiteColor()
        thumbView.layer.cornerRadius = thumbView.frame.height / 2
        
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        
        for index in 0...labels.count - 1{
            var label = labels[index]
            
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRectMake(xPosition, 0, labelWidth, labelHeight)
        }
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let location = touch.locationInView(self)
        var calculatedIndex:Int?
        
        for(index, item) in labels.enumerate(){
            if item.frame.contains(location){
                calculatedIndex = index
            }
        }
        
        if calculatedIndex != nil{
            selectedIndex = calculatedIndex!
            sendActionsForControlEvents(.ValueChanged)
        }
        
        return false
    }
   
    func displayNewSelectedIndex(){
        var label = labels[selectedIndex]
        self.thumbView.frame = label.frame
    }
    
}
