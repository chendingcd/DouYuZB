//
//  MainViewController.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "My")
    }
    
    private func addChildVC(storyName:String){
        let childVC = UIStoryboard(name:storyName,bundle:nil).instantiateInitialViewController()!
        addChildViewController(childVC)
    }


}
