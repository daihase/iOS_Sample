//
//  Shape.swift
//  FadeInFadeOutTransition
//
//  Created by Libra Studio, Inc. on 2015/09/01.
//  Copyright (c) 2015年 Libra Studio, Inc. All rights reserved.
//

import UIKit

class Shape: UIView {

    var screenSize: CGSize?
    
    init(size: CGSize){
        self.screenSize = size

        super.init(frame: CGRect(x: 0, y: 0, width: screenSize!.width, height: screenSize!.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        let context = UIGraphicsGetCurrentContext();
        let rect = CGRectMake(0, 0, screenSize!.width, screenSize!.height);
        
        //Color set.
        CGContextSetRGBFillColor(context, 0, 0, 0, 1);
        CGContextAddRect(context, rect);
        CGContextFillPath(context);
    }
}
