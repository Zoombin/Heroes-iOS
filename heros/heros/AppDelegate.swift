//
//  AppDelegate.swift
//  heros
//
//  Created by yc on 15-5-5.
//  Copyright (c) 2015年 yc. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var audioPlayer: AVAudioPlayer!
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        //定义一个视图控制器
        let vc = MainViewController(nibName:nil, bundle: nil);
        //创建导航控制器
        let nvc = UINavigationController(rootViewController:vc);
        //设置根视图
        self.window!.rootViewController = nvc;
        playBgMusic()
        return true
    }
    
    func playBgMusic(){
        let musicPath = NSBundle.mainBundle().pathForResource("bgmusic", ofType: "mp3")
        //指定音乐路径
        let url = NSURL(fileURLWithPath: musicPath!)
        audioPlayer = try? AVAudioPlayer(contentsOfURL: url)
        audioPlayer.numberOfLoops = -1
        //设置音乐播放次数，-1为循环播放
        audioPlayer.volume = 1
        //设置音乐音量，可用范围为0~1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if audioPlayer.playing {
            audioPlayer.stop()
        }
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if !audioPlayer.playing {
            audioPlayer.play()
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

