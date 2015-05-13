//
//  VMainViewController.swift
//  heros
//
//  Created by yc on 15-5-5.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit
import AVFoundation

let topScrollView = UIScrollView()
let pageControl = UIPageControl()
let button1 = UIButton();
let button2 = UIButton();
let button3 = UIButton();

class MainViewController: UIViewController, UIScrollViewDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "请左右滑动选择大侠类型"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "main_nav_bg"), forBarMetrics: UIBarMetrics.Default)
        
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: UIColor.whiteColor(),NSForegroundColorAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute
        
        let screenWidth = UIScreen .mainScreen().bounds.size.width
        let screenHeight = UIScreen .mainScreen().bounds.size.height - 64
        
        let rect = CGRectMake(0, 0, screenWidth, screenHeight * 2/3)
        
        topScrollView.frame = rect
        topScrollView.backgroundColor = UIColor .lightGrayColor()
        topScrollView.contentSize = CGSizeMake(screenWidth * 4, 0)
        topScrollView.pagingEnabled = true
        topScrollView.delegate = self
        self.view.addSubview(topScrollView)

        let topTitles = ["hero_type_liliang", "hero_type_jiqiao", "hero_type_sudu", "hero_type_zhenqi"]
        for index in 0...3 {
            let offSetX = rect.width * CGFloat(index)
            let button : UIButton = UIButton()
            button.frame = CGRectMake(offSetX, 0, rect.width, rect.height)
            button.backgroundColor = UIColor .lightGrayColor()
            button.setBackgroundImage(UIImage(named: topTitles[index]), forState: UIControlState.Normal)
            topScrollView.addSubview(button)
        }
        
        let pageControlFrame = CGRectMake(0, CGRectGetMaxY(rect) - 20, rect.size.width, 20)
        pageControl.frame = pageControlFrame
        pageControl.numberOfPages = 4
        self.view.addSubview(pageControl)
        
        let buttonHeight = (screenHeight - rect.height) / 3;
        let buttonWidth = screenWidth;
        
        var buttons = [button1, button2, button3];
        var titles = ["游戏卡牌", "游戏规则", "武器"];
        for index in 0...2 {
            let button : UIButton = buttons[index]
            let offSetY = CGRectGetMaxY(rect) + buttonHeight * CGFloat(index)
            button.frame = CGRectMake(0, offSetY, buttonWidth, buttonHeight)
            button.backgroundColor = UIColor .lightGrayColor()
            button.setBackgroundImage(UIImage(named: "btn_shot"), forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage(named: "btn_shot_selected"), forState: UIControlState.Highlighted)
            button.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            button.setTitle(titles[index], forState: UIControlState.Normal)
            self.view.addSubview(button)
        }
    }
    
    func buttonClick(sender : UIButton) {
        
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

