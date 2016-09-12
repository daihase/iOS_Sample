//
//  BaseDialogView.swift
//  CustomDialogSample
//
//  Created by Libra Studio, Inc on. 2015/11/24.
//  Copyright © 2015年 daihase. All rights reserved.
//

import UIKit

class BaseDialogView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
