//
//  VMainViewController.swift
//  heros
//
//  Created by yc on 15-5-5.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit

let scrollView = UIScrollView()
let pageControl = UIPageControl()
class MainViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true;
        let screenWidth = UIScreen .mainScreen().bounds.size.width
        let rect = CGRectMake(0, 0, screenWidth, 300)
        scrollView.frame = rect
        scrollView.backgroundColor = UIColor .lightGrayColor()
        scrollView.contentSize = CGSizeMake(screenWidth * 3, 0)
        scrollView.pagingEnabled = true
        self.view.addSubview(scrollView)
        
        let pageControlFrame = CGRectMake(0, CGRectGetMaxY(rect) - 20, rect.size.width, 20)
        pageControl.frame = pageControlFrame
        pageControl.numberOfPages = 3
        self.view.addSubview(pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

