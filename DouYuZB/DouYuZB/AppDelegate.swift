//
//  AppDelegate.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UITabBar.appearance().tintColor = UIColor.orange
        
        return true
    }


}

