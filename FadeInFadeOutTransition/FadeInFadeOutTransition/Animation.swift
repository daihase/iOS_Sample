//
//  Animation.swift
//  FadeInFadeOutTransition
//
//  Created by Libra Studio, Inc. on 2015/09/01.
//  Copyright (c) 2015年 Libra Studio, Inc. All rights reserved.
//

import UIKit

//Protocol
protocol AnimationDelegate {
    func transition()
}

class Animation {
    
    struct Static {
        static var delegate: AnimationDelegate?
    }
    
    /**
    * FadeOut
    **/
    class func fadeOutAnimation(view: UIView, shape: Shape, delay: NSTimeInterval){
        
        shape.alpha = 0
        view.addSubview(shape)
        
        UIView.animateWithDuration(
            delay,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                shape.alpha = 1
            },
            completion: {
                (Bool) -> Void in
                Static.delegate?.transition()
                return
            }
        )
    }
    
    /**
    * FadeIn
    **/
    class func fadeInAnimation(shape: Shape, delay: NSTimeInterval){
        
        UIView.animateWithDuration(
            delay,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                shape.alpha = 0
            },
            completion: {
                (Bool) -> Void in
                return
            }
        )
    }
}
