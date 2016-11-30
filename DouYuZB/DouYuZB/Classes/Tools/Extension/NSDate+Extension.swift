//
//  NSDate+Extension.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import Foundation

extension NSDate{
    class func getCurrentTime() ->String{
        let nowDate = NSDate()
        let interval = nowDate.timeIntervalSince1970
        
        return "\(interval)"
    }
}
