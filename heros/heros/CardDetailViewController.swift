//
//  CardDetailViewController.swift
//  heros
//
//  Created by yc on 15-5-13.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController, UIScrollViewDelegate{
    var cardsArray : NSArray = NSArray()
    var cardIndex : NSInteger = 0
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 217/255.0, green: 194/255.0, blue: 150/255.0, alpha: 1.0)
        
        let screenWidth = UIScreen .mainScreen().bounds.size.width
        let screenHeight = UIScreen .mainScreen().bounds.size.height - 64
        
        let tipsLabel = UILabel()
        tipsLabel.frame = CGRectMake(0, 0, screenWidth, 40)
        tipsLabel.textColor = UIColor.whiteColor()
        tipsLabel.backgroundColor = UIColor.clearColor()
        tipsLabel.font = UIFont.systemFontOfSize(17)
        tipsLabel.textAlignment = NSTextAlignment.Center
        tipsLabel.text = "<<--左右滑动查看-->>"
        self.view.addSubview(tipsLabel)
        
        scrollView.frame = CGRectMake(0, 40, screenWidth, screenHeight - 40)
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = CGSizeMake(screenWidth * CGFloat(cardsArray.count), 0)
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        for index in 0...(cardsArray.count - 1) {
            let info = cardsArray.objectAtIndex(index) as NSDictionary
            var imagePath = info.objectForKey("imagepath") as NSString
            imagePath = imagePath.stringByReplacingOccurrencesOfString(".jpg", withString: "")
            let offSetX = screenWidth * CGFloat(index)
            let imageView : UIImageView = UIImageView()
            imageView.frame = CGRectMake(offSetX, 0, screenWidth, screenHeight - 40)
            imageView.image = UIImage(named: imagePath)
            scrollView.addSubview(imageView)
        }
        
        scrollView.setContentOffset(CGPointMake(screenWidth * CGFloat(cardIndex), 0), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCardsArrayAndIndex(array : NSArray, index : NSInteger) {
        cardsArray = array;
        cardIndex = index
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
