//
//  CollectionPrettyCell.swift
//  DouYuZB
//
//  Created by 陈鼎 on 2016/11/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: UICollectionViewCell {

    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var nikNameLabel: UILabel!
    @IBOutlet weak var onLineBtn: UIButton!
    @IBOutlet weak var scrImageView: UIImageView!
    
    var anchor: AnchorModel?{
        didSet{
            
            guard let anchor = anchor else {return}
            var onlineStr: String = ""
            if anchor.online >= 10000{
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else{
                onlineStr = "\(anchor.online)在线"
            }
            onLineBtn.setTitle(onlineStr, for: .normal)
            
            nikNameLabel.text = anchor.nickname
            
            cityBtn.setTitle(anchor.anchor_city, for: .normal)
            
            guard let iconURL = URL(string: anchor.verticl_scr) else {
                return
            }
            scrImageView.kf.setImage(with: iconURL)
        }
    }
    
}
