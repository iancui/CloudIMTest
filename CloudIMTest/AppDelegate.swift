//
//  AppDelegate.swift
//  CloudIMTest
//
//  Created by Ian on 15/10/22.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?

    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        
        print(userId)
        switch userId {
        case "iancui":
            userInfo.name = "微忧"
            userInfo.portraitUri = "http://img.name2012.com/uploads/allimg/2015-06/30-023131_451.jpg"
        case "daiyan":
            userInfo.name = "左耳"
            userInfo.portraitUri = "http://b94.photo.store.qq.com/psb?/25cefd63-86e2-48fa-9280-8b7282443d8e/NEoOyFn13.Gxe9TNZP9H5zNmNSiqX.xt59CbeQEWhRc!/b/YdBdDTgLOwAAYnXQCDiwOwAA&bo=wAMgAwAAAAABAMc!&rf=viewer_4"
        default:
            print("no user")
        }
        
        return completion(userInfo)
        
    }
    
    
    func connectServer(completion: ()-> Void){
        
        // 查询保存的token
        //let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as! String
        // 初始化
        RCIM.sharedRCIM().initWithAppKey("25wehl3uwkevw")
        

        // 用token测试连接
        RCIM.sharedRCIM().connectWithToken("UAznPGwCngNjW5P1UiV7csdQGsPYgPfSkPFZ/jhM6/8dm5sA6dsE3yMw2zEvUzD9P1dcQ+A9LnrjxSGa4NC0QQ==", success: { (_) -> Void in
            
            let currentUser = RCUserInfo(userId: "iancui", name: "微忧", portrait: "http://p4.gexing.com/G1/M00/CA/43/rBABFFHflSKimYo7AAAZiDG7IEk793_200x200_3.jpg")
            
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                   completion()
            })
            
         
            
            }, error: { (_) -> Void in
                print("连接失败")
            }) { () -> Void in
                print("Token不正确，或已经失效")
        }

    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // 设置用户信息提供者为自己
        RCIM.sharedRCIM().userInfoDataSource = self
//        RCIM.sharedRCIM().groupInfoDataSource = self
        //如果使用美国站点，请加上这行代码 [AVOSCloud useAVCloudUS];
        //        [AVOSCloud setApplicationId:@"xFCJERJwGqQeQubfqhFuYgzW"
        //        clientKey:@"g0p6HU5cGcwwvskTbFJ9bDwv"];
        AVOSCloud.setApplicationId("xFCJERJwGqQeQubfqhFuYgzW", clientKey: "g0p6HU5cGcwwvskTbFJ9bDwv")
        //        如果想跟踪统计应用的打开情况，后面还可以添加下列代码：
        //        [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

