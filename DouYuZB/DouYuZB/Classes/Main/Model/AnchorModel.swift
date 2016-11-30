//
//  AnchorModel.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    
    var room_id : Int = 0
    var verticl_scr : String = ""
    var isVertical : Int = 0
    var room_name : String = ""
    var nickname : String = ""
    var online : Int = 0
    var anchor_city : String = ""
    
    
    init(dict: [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {

    }
}
