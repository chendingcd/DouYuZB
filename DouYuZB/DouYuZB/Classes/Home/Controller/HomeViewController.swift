//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
}

extension HomeViewController{
    func setupUI(){
        setupNavgationBar()
    }
    
    private func setupNavgationBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageName: "logo")
        
        let size = CGSize(width:40,height:40)
        
        let historyItem = UIBarButtonItem.init(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)

        let searchItem = UIBarButtonItem.init(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem.init(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)

        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}
