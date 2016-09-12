//
//  CustomView.swift
//  CustomDialogSample
//
//  Created by Libra Studio, Inc. on 2015/11/24.
//  Copyright © 2015年 NPC251. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    convenience init(){
        self.init(frame: CGRectZero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
