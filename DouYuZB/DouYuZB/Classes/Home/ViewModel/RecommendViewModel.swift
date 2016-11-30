//
//  RecommendViewModel.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class RecommendViewModel {
    
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
    lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    lazy var prettyGroup : AnchorGroup = AnchorGroup()

}

extension RecommendViewModel{
    func requestData(finishCallback: @escaping () -> ()){
        
        let paremeters = ["limit":"4", "offset":"0", "time":NSDate.getCurrentTime()]
        
        let disgroup = DispatchGroup()
        disgroup.enter()
    
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time":NSDate.getCurrentTime()]){(result) in
            
            guard let resultDict = result as? [String: NSObject] else{return}
            
            guard let dataArray = resultDict["data"] as? [[String:NSObject]] else{return}
            
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            for dict in dataArray{
                let anchor = AnchorModel.init(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            disgroup.leave()
            print("请求到第0组")
        }

        
        disgroup.enter()
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: paremeters){(result) in
            
            guard let resultDict = result as? [String: NSObject] else{return}
            
            guard let dataArray = resultDict["data"] as? [[String:NSObject]] else{return}
            
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            for dict in dataArray{
                let anchor = AnchorModel.init(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            disgroup.leave()
            print("请求到第1组")

        }

        
        disgroup.enter()
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: paremeters){(result) in

            guard let resultDict = result as? [String: NSObject] else{return}
            
            guard let dataArray = resultDict["data"] as? [[String:NSObject]] else{return}
            
            for dict in dataArray {
                let group = AnchorGroup.init(dict: dict)
                self.anchorGroups.append(group)
            }
            disgroup.leave()
            print("请求到第2组")
        }
        
        disgroup.notify(queue: DispatchQueue.main) {
            
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishCallback()
        }

    }
}
