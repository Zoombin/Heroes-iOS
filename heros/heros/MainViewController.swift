//
//  VMainViewController.swift
//  heros
//
//  Created by yc on 15-5-5.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit

let topScrollView = UIScrollView()
let pageControl = UIPageControl()
let button1 = UIButton();
let button2 = UIButton();
let button3 = UIButton();

class MainViewController: UIViewController, UIScrollViewDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        let screenWidth = UIScreen .mainScreen().bounds.size.width
        let screenHeight = UIScreen .mainScreen().bounds.size.height
        
        let rect = CGRectMake(0, 0, screenWidth, screenHeight * 2/3)
        
        topScrollView.frame = rect
        topScrollView.backgroundColor = UIColor .lightGrayColor()
        topScrollView.contentSize = CGSizeMake(screenWidth * 3, 0)
        topScrollView.pagingEnabled = true
        topScrollView.delegate = self
        self.view.addSubview(topScrollView)
        
        let pageControlFrame = CGRectMake(0, CGRectGetMaxY(rect) - 20, rect.size.width, 20)
        pageControl.frame = pageControlFrame
        pageControl.numberOfPages = 3
        self.view.addSubview(pageControl)
        
        let buttonHeight = (screenHeight - rect.height) / 3;
        let buttonWidth = screenWidth;
        
        var buttons = [button1, button2, button3];
        for index in 0...2 {
            let button : UIButton = buttons[index]
            let offSetY = CGRectGetMaxY(rect) + buttonHeight * CGFloat(index)
            button.frame = CGRectMake(0, offSetY, buttonWidth, buttonHeight)
            button.backgroundColor = UIColor .lightGrayColor()
            button .setBackgroundImage(UIImage(named: "btn_shot"), forState: UIControlState.Normal)
            self.view.addSubview(button)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
       let page = (scrollView.contentOffset.x / scrollView.bounds.size.width)
        pageControl.currentPage = Int(page)
    }
    
}

