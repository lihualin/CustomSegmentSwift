//
//  ViewController.swift
//  CustomSegmentSwift
//
//  Created by lihualin on 15/6/16.
//  Copyright (c) 2015年 lihualin. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,CustomSegmentDelegate{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var segment = CustomSegment()
        segment.lineWidth = 0.5
        segment.lineBottom = 0.5
        segment.selectedColor = UIColor.magentaColor()
        segment.tineColor = UIColor.redColor()
        segment.createSelf(CGRectMake(0, 200, 320, 40), titles: ["item1","item2"])
        segment.delegate = self
        
//        segment.setTineColor(UIColor.redColor())
        self.view.addSubview(segment)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    func segmentSelectedIndex(index: Int) {
         print(String(index)+"\n")
    }

}

