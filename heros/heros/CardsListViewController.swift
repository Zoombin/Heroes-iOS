//
//  CardsListViewController.swift
//  heros
//
//  Created by yc on 15-5-13.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit


class CardsListViewController: UIViewController {
    var cardFile : NSString = ""
    var cardsArray : NSArray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 217/255.0, green: 194/255.0, blue: 150/255.0, alpha: 1.0)
        print(cardFile)
        cardFile = cardFile.stringByReplacingOccurrencesOfString("_type", withString: "")
        let filePath = NSBundle.mainBundle().pathForResource(cardFile as String, ofType: "txt")
        let txtString = try? NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
        print(txtString)
        
        let data = txtString?.dataUsingEncoding(NSUTF8StringEncoding)
        cardsArray = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        
        let screenWidth = UIScreen .mainScreen().bounds.size.width
        let screenHeight = UIScreen .mainScreen().bounds.size.height - 64
        let rect = CGRectMake(0, 0, screenWidth, screenHeight * 2/3)
        let buttonHeight = (screenHeight - rect.height) / 3;
        let buttonWidth = screenWidth;
        
        let count = cardsArray.count
        let scrollView = UIScrollView()
        scrollView.frame = CGRectMake(0, 0, screenWidth, screenHeight)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = CGSizeMake(0, CGFloat(count) * buttonHeight)
        self.view.addSubview(scrollView)
        
        
        for index in 0...(count - 1) {
            let info = cardsArray.objectAtIndex(index) as! NSDictionary
            let name = info.objectForKey("name") as! NSString
            let button : UIButton = UIButton()
            let offSetY = 	buttonHeight * CGFloat(index)
            button.frame = CGRectMake(0, offSetY, buttonWidth, buttonHeight)
            button.backgroundColor = UIColor.clearColor()
            button.setBackgroundImage(UIImage(named: "btn_shot.png"), forState: UIControlState.Normal)
            button.tag = index
            button.setTitle(name as String, forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage(named: "btn_shot_selected.png"), forState: UIControlState.Highlighted)
            button.addTarget(self, action: "showDetail:", forControlEvents: UIControlEvents.TouchUpInside)
            scrollView.addSubview(button)
        }
    }
    
    func showDetail(sender : UIButton) {
        let cardDetail = CardDetailViewController()
        cardDetail.title = self.title
        cardDetail.setCardsArrayAndIndex(cardsArray, index: sender.tag)
        self.navigationController?.pushViewController(cardDetail, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func setFileName(fileName : NSString) {
        cardFile = fileName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
