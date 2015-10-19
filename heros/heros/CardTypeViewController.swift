//
//  CardTypeViewController.swift
//  heros
//
//  Created by yc on 15-5-13.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit

class CardTypeViewController: UIViewController {
    
    var cardFile : NSString = ""
    var cardsArray : NSArray = NSArray()
    var isBase : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 217/255.0, green: 194/255.0, blue: 150/255.0, alpha: 1.0)
        
        cardFile = cardFile.stringByReplacingOccurrencesOfString("_type", withString: "")
        let filePath = NSBundle.mainBundle().pathForResource(cardFile as String, ofType: "txt")
        let txtString = try! NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
        print(txtString)
        
        let data = txtString.dataUsingEncoding(NSUTF8StringEncoding)
        cardsArray = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        
        
        let screenWidth = UIScreen .mainScreen().bounds.size.width
        let screenHeight = UIScreen .mainScreen().bounds.size.height - 64
        let rect = CGRectMake(0, 0, screenWidth, screenHeight * 2/3)
        let buttonHeight = (screenHeight - rect.height) / 3;
        let buttonWidth = screenWidth;
        
        let topImageView : UIImageView = UIImageView()
        topImageView.frame = CGRectMake(0, 0, screenWidth, screenHeight / 2)
        topImageView.image = UIImage(named: "card_outside")
        self.view.addSubview(topImageView)
        
        let titleLabel : UILabel = UILabel()
        titleLabel.frame = CGRectMake(0, (screenHeight / 2) - 60, screenWidth, 40)
        titleLabel.text = self.title
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        titleLabel.font = UIFont.boldSystemFontOfSize(17)
        titleLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLabel)
        
        let count = cardsArray.count
        let scrollView = UIScrollView()
        scrollView.frame = CGRectMake(0, screenHeight / 2, screenWidth, screenHeight / 2)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = CGSizeMake(0, CGFloat(count) * buttonHeight)
        self.view.addSubview(scrollView)
        
        for index in 0...(count - 1) {
            let info = cardsArray.objectAtIndex(index) as! NSDictionary
            let name = info.objectForKey("name") as! NSString
            let button : UIButton = UIButton()
            let offSetY = buttonHeight * CGFloat(index)
            button.frame = CGRectMake(0, offSetY, buttonWidth, buttonHeight)
            button.backgroundColor = UIColor.clearColor()
            button.setBackgroundImage(UIImage(named: "btn_shot"), forState: UIControlState.Normal)
            button.tag = index
            button.setTitle(name as String, forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage(named: "btn_shot_selected"), forState: UIControlState.Highlighted)
            button.addTarget(self, action: "showDetail:", forControlEvents: UIControlEvents.TouchUpInside)
            scrollView.addSubview(button)
        }
    }
    
    internal func setFileName(fileName : NSString) {
        cardFile = fileName
    }
    
    func showDetail(sender : UIButton) {
        let cardTypeVC = CardTypeViewController()
        let info : NSDictionary = cardsArray.objectAtIndex(sender.tag) as! NSDictionary
        let name : NSString = info.objectForKey("name") as! NSString
        var fileName : NSString = ""
        var showDetail : Bool = false
        if (name.isEqualToString("基础版")) {
            fileName = "image_cate"
            isBase = true
        } else if (name.isEqualToString("标准版")) {
            fileName = "image_cate"
            isBase = false
        } else if (name.isEqualToString("身份牌")) {
            showDetail = true
            if (isBase) {
                fileName = "identity_s"
            } else {
                fileName = "identity"
            }
        } else if (name.isEqualToString("招式牌")) {
            fileName = "moves_cate"
        } else if (name.isEqualToString("功法牌")) {
            fileName = "magic_cate"
        } else if (name.isEqualToString("智计牌")) {
            showDetail = true
            if (isBase) {
                fileName = "clever_s"
            } else {
                fileName = "clever"
            }
        } else if (name.isEqualToString("药牌")) {
            showDetail = true
            if (isBase) {
                fileName = "drug_s"
            } else {
                fileName = "drug"
            }
        } else if (name.isEqualToString("力属性")) {
            showDetail = true
            if (isBase) {
                fileName = "moves_li_s"
            } else {
                fileName = "moves_li"
            }
        } else if (name.isEqualToString("技属性")) {
            showDetail = true
            if (isBase) {
                fileName = "moves_ji_s"
            } else {
                fileName = "moves_ji"
            }
        } else if (name.isEqualToString("气属性")) {
            showDetail = true
            if (isBase) {
                fileName = "moves_qi_s"
            } else {
                fileName = "moves_qi"
            }
        } else if (name.isEqualToString("速属性")) {
            showDetail = true
            if (isBase) {
                fileName = "moves_su_s"
            } else {
                fileName = "moves_su"
            }
        } else if (name.isEqualToString("内功牌")) {
            showDetail = true
            if (isBase) {
                fileName = "magic_neigong_s"
            } else {
                fileName = "magic_neigong"
            }
        } else if (name.isEqualToString("轻功牌")) {
            showDetail = true
            if (isBase) {
                fileName = "magic_qinggong_s"
            } else {
                fileName = "magic_qinggong"
            }
        } else if (name.isEqualToString("心法牌")) {
            showDetail = true
            if (isBase) {
                fileName = "magic_xinfa_s"
            } else {
                fileName = "magic_xinfa"
            }
        }
        if (showDetail) {
            let cardsListVC = CardsListViewController()
            cardsListVC.setFileName(fileName)
            cardsListVC.title = name as String
            self.navigationController?.pushViewController(cardsListVC, animated: true)
            return
        }
        cardTypeVC.setFileName(fileName)
        cardTypeVC.isBase = isBase
        cardTypeVC.title = info.objectForKey("name") as! NSString as String
        self.navigationController?.pushViewController(cardTypeVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
