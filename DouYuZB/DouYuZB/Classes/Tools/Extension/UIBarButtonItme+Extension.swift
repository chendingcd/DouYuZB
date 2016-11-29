//
//  UIBarButtonItme+Extension.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
//    class func createItem(imageName:String, highImageName:String, size:CGSize) ->UIBarButtonItem{
//        let btn = UIButton()
//        btn.setImage(UIImage(named:imageName), for: .normal)
//        btn.setImage((UIImage(named:highImageName)), for: .highlighted)
//        btn.frame = CGRect.init(origin: CGPoint.zero, size: size)
//        return UIBarButtonItem.init(customView: btn);
//    }
    
    //便利构造函数
    convenience init(imageName:String, highImageName:String = "", size:CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        if highImageName != ""{
            btn.setImage((UIImage(named:highImageName)), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect.init(origin: CGPoint.zero, size: size)

        }
        self.init(customView:btn)
    }
}
