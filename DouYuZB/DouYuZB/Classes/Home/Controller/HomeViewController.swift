//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    fileprivate lazy var pageTitleView : PageTiteView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kSatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTiteView.init(frame: titleFrame, titles: titles)
        
        titleView.delegate = self
        
        return titleView
    }()
    
    fileprivate lazy var pageContentView: PageContentView = {[weak self] in
        
        let contentH = kScreenH - kSatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let contentFrame = CGRect.init(x: 0, y: kSatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        var childVCs = [UIViewController]()
        childVCs.append(RecommendViewController())
        for _ in 0..<3 { 
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.init(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVCs.append(vc)
        }
        
        let contentView = PageContentView.init(frame: contentFrame, childVCs: childVCs, parentViewController: self)
        contentView.delegate = self as PageContentViewDelegate?
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
}

extension HomeViewController{
    func setupUI(){
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavgationBar()
        
        view.addSubview(pageTitleView)
        
        view.addSubview(pageContentView)
        
        pageContentView.backgroundColor = UIColor.yellow

    }
    
    fileprivate func setupNavgationBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width:40,height:40)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)

        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)

        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}

extension HomeViewController: PageTiteViewDelegate{
    func pageTiteView(titleView: PageTiteView, selectIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

extension HomeViewController: PageContentViewDelegate{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
