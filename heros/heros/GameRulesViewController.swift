//
//  GameRulesViewController.swift
//  heros
//
//  Created by yc on 15-5-13.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit
class GameRulesViewController: BaseViewController {
    
    let webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "游戏规则"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "main_nav_bg"), forBarMetrics: UIBarMetrics.Default)
        self.view.backgroundColor = UIColor.whiteColor()
        
        webView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 64)
        webView.scalesPageToFit = true
        webView.scrollView.bounces = true;
        webView.scrollView.alwaysBounceHorizontal = true
        webView.dataDetectorTypes = UIDataDetectorTypes.None
        webView.backgroundColor = UIColor(red: 217/255.0, green: 194/255.0, blue: 150/255.0, alpha: 1.0)
        self.view.addSubview(webView)
        
        let filePath = NSBundle.mainBundle().pathForResource("rule", ofType: "html")
        let htmlString = try! NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
        webView.loadHTMLString(htmlString as String, baseURL: nil)
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
