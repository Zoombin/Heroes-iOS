//
//  GameRulesViewController.swift
//  heros
//
//  Created by yc on 15-5-13.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit
class GameRulesViewController: UIViewController {
    
    let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "游戏规则"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "main_nav_bg"), forBarMetrics: UIBarMetrics.Default)
        self.view.backgroundColor = UIColor.whiteColor()
        
        textView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 64)
        textView.editable = false
        textView.textColor = UIColor.whiteColor()
        textView.font = UIFont.systemFontOfSize(17)
        textView.backgroundColor = UIColor(red: 217/255.0, green: 194/255.0, blue: 150/255.0, alpha: 1.0)
        self.view.addSubview(textView)
        
        let filePath = NSBundle.mainBundle().pathForResource("rule", ofType: "txt")
        let htmlString = NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: nil)
        textView.text = htmlString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
