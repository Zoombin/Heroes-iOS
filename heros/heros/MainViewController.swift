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
        self.view.backgroundColor = UIColor(red: 217/255.0, green: 194/255.0, blue: 150/255.0, alpha: 1.0)
        
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: UIColor.whiteColor(),NSForegroundColorAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute
        
        let screenWidth = UIScreen .mainScreen().bounds.size.width
        let screenHeight = UIScreen .mainScreen().bounds.size.height - 64
        
        let rect = CGRectMake(0, 0, screenWidth, screenHeight * 2/3)
        
        topScrollView.frame = rect
        topScrollView.backgroundColor = UIColor.clearColor()
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
            button.tag = index
            button.setBackgroundImage(UIImage(named: topTitles[index]), forState: UIControlState.Normal)
            button.addTarget(self, action: "topButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            topScrollView.addSubview(button)
        }
        
        let pageControlFrame = CGRectMake(0, CGRectGetMaxY(rect) - 20, rect.size.width, 20)
        pageControl.frame = pageControlFrame
        pageControl.numberOfPages = 4
        self.view.addSubview(pageControl)
        
        let buttonHeight = (screenHeight - rect.height) / 3;
        let buttonWidth = screenWidth;
        
        var titles = ["游戏卡牌", "游戏规则", "武器"];
        for index in 0...2 {
            let button : UIButton = UIButton()
            let offSetY = CGRectGetMaxY(rect) + buttonHeight * CGFloat(index)
            button.frame = CGRectMake(0, offSetY, buttonWidth, buttonHeight)
            button.backgroundColor = UIColor.clearColor()
            button.setBackgroundImage(UIImage(named: "btn_shot"), forState: UIControlState.Normal)
            button.tag = index
            button.setBackgroundImage(UIImage(named: "btn_shot_selected"), forState: UIControlState.Highlighted)
            button.addTarget(self, action: "bottomButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            button.setTitle(titles[index], forState: UIControlState.Normal)
            self.view.addSubview(button)
        }
    }
    
    func topButtonClick(sender : UIButton) {
        let topTitles = ["hero_type_liliang", "hero_type_jiqiao", "hero_type_sudu", "hero_type_zhenqi"]
        let cardsListVC = CardsListViewController()
        if (sender.tag == 0) {
            cardsListVC.title = "力量大侠"
            cardsListVC.setFileName(topTitles[0])
        } else if (sender.tag == 1) {
            cardsListVC.title = "技巧大侠"
            cardsListVC.setFileName(topTitles[1])
        } else if (sender.tag == 2) {
            cardsListVC.title = "速度大侠"
            cardsListVC.setFileName(topTitles[2])
        } else if (sender.tag == 3) {
            cardsListVC.title = "真气大侠"
            cardsListVC.setFileName(topTitles[3])
        }
        self.navigationController?.pushViewController(cardsListVC, animated: true)
    }
    
    func bottomButtonClick(sender : UIButton) {
        if (sender.tag == 0) {
            
        } else if (sender.tag == 1) {
            let gameRulesVC = GameRulesViewController()
            self.navigationController?.pushViewController(gameRulesVC, animated: true)
        } else if (sender.tag == 2) {
            let cardsListVC = CardsListViewController()
            cardsListVC.title = "武器列表"
            cardsListVC.setFileName("weapon")
            self.navigationController?.pushViewController(cardsListVC, animated: true)
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

