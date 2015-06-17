//
//  CustomSegment.swift
//  CustomSegmentSwift
//    其他信息可随时更改
//  Created by lihualin on 15/6/16.
//  Copyright (c) 2015年 lihualin. All rights reserved.
//

import UIKit

protocol CustomSegmentDelegate{
    func segmentSelectedIndex(index:Int)
}

class CustomSegment: UIView {
    var tineColor:UIColor!
    var lineArray:NSMutableArray!
    var rowLines:NSMutableArray!
    var btnArray:NSMutableArray!
    var lineWidth:CGFloat!
    var lineBottom:CGFloat!
    var selectedIndex:Int!
    var selectedColor:UIColor!
    var delegate:CustomSegmentDelegate!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    //创建segment
    func createSelf(frame:CGRect , titles:NSArray){
        self.frame = frame;
        self.backgroundColor = UIColor.clearColor()
        if titles.count != 0 {
            btnArray = NSMutableArray()
            let width = CGFloat(CGFloat(self.frame.size.width)/CGFloat(titles.count))
            for (var i = 0; i < titles.count; i++){
                let btn = UIButton()
                btn.frame = CGRectMake(CGFloat(i)*width, 0, width, self.frame.size.height)
                btn.tag = 10+i
                btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Selected)
                btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Highlighted)
                btn.setTitle(titles.objectAtIndex(i) as NSString, forState: UIControlState.Normal)
                btn.setTitle(titles.objectAtIndex(i) as NSString, forState: UIControlState.Selected)
                btn.setTitle(titles.objectAtIndex(i) as NSString, forState: UIControlState.Highlighted)
                btn.backgroundColor = UIColor.whiteColor()
                btn.addTarget(self, action: Selector("btnSelectedAction:"), forControlEvents: UIControlEvents.TouchUpInside)
               self.addSubview(btn)
                btnArray.addObject(btn)
            }
            if lineWidth != nil {
                rowLines = NSMutableArray()
                for (var i = 0; i < titles.count-1; i++){
                    let rowLine = UIView()
                    rowLine.frame = CGRectMake(CGFloat(i+1)*width-lineWidth/2, 0, lineWidth, self.frame.size.height)
                    rowLine.tag = 20+i
                    if self.tineColor == nil {
                        rowLine.backgroundColor = UIColor.lightGrayColor()
                    }else{
                        rowLine.backgroundColor = self.tineColor
                    }
                    self.addSubview(rowLine)
                    rowLines.addObject(rowLine)
                }
            }
            if lineBottom != nil {
                lineArray = NSMutableArray()
                for (var i = 0; i < titles.count; i++){
                    let rowLine = UIView()
                    rowLine.frame = CGRectMake(CGFloat(i)*width, self.frame.size.height-lineBottom, width, lineBottom)
                    rowLine.tag = 30+i
                    if self.tineColor == nil {
                        rowLine.backgroundColor = UIColor.lightGrayColor()
                    }else{
                        rowLine.backgroundColor = self.tineColor
                    }
                    self.addSubview(rowLine)
                    lineArray.addObject(rowLine)
                }
            }
            
             selectedIndex = 0
            
            if tineColor != nil {
               setTineColor(tineColor)
            }
           
            setSelectedIndex(selectedIndex)
        }
    }
    //默认选择
    func setSelectedIndex(index:Int){
        UIView.animateWithDuration(0.5, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            let btn = self.btnArray.objectAtIndex(index) as UIButton
            btn.selected = true
            if self.lineArray != nil && self.selectedColor != nil{
                let lineView = self.lineArray.objectAtIndex(index) as UIView
                lineView.backgroundColor = self.selectedColor
            }
            }, completion:nil)
        
    }
    
   
    //按钮点击事件
    func btnSelectedAction(btn:UIButton){
       
        UIView.animateWithDuration(0.5, delay: 0.15, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            for button in self.btnArray{
                (button as UIButton).selected = false
            }
            if btn.selected == false{
                btn.selected = true
            }
            if self.lineArray != nil  && self.selectedColor != nil{
                for view in self.lineArray {
                    if self.tineColor == nil {
                        (view as UIView).backgroundColor = UIColor.lightGrayColor()
                    }else{
                        (view as UIView).backgroundColor = self.tineColor
                    }
                }
                let lineView = self.lineArray.objectAtIndex(btn.tag-10) as UIView
                lineView.backgroundColor = self.selectedColor
            }
            }, completion:nil)
        
        self.delegate.segmentSelectedIndex(btn.tag-10)
    }

    
    //设置线色
    func setTineColor(color:UIColor){
        if self.lineArray != nil {
            for view in self.lineArray {
                (view as UIView).backgroundColor = color
            }
        }
        
        if self.selectedColor != nil {
            let lineView = self.lineArray.objectAtIndex(selectedIndex) as UIView
            lineView.backgroundColor = self.selectedColor
        }
        
        if self.rowLines != nil {
            for view in self.rowLines {
                (view as UIView).backgroundColor = color
            }
        }
        
    }
}
