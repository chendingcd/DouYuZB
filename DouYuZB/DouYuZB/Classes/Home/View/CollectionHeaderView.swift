//
//  CollectionHeaderView.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    var group: AnchorGroup?{
        didSet{
//            titleLabel = UILabel()
//            titleLabel.text = ""
            //titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "")
        }
    }
    
}
