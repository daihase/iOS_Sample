//
//  DialogView.swift
//  CustomDialogSample
//
//  Created by Libra Studio, Inc. on 2015/11/24.
//  Copyright © 2015年 daihase. All rights reserved.
//

/** このクラスではViewControllerのための描画周りだけを担当し、ボタンなどの処理は行わない **/

import UIKit

class DialogView: BaseDialogView {
    var mDelegate: DialogViewController! // このDialogViewクラス内でボタン処理などをさせず対象のViewController内で各々処理させる.
    var mView: UIView!
    var mButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(){
        super.init()
        
        // 閉じるボタン.
        self.mButton = UIButton()
        self.mButton.backgroundColor = UIColor.blueColor()
        self.mButton.layer.masksToBounds = true
        self.mButton.setTitle("close", forState: UIControlState.Normal)
        self.mButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.mButton.addTarget(self, action: #selector(DialogView.closeDialog), forControlEvents: .TouchUpInside)
        self.mView = UIView(frame: CGRectZero)
        self.mView.backgroundColor = UIColor.redColor()
        self.backgroundColor = UIColor(red:0,green:0,blue:0,alpha:0.6)
        
        self.addSubview(self.mView)
        self.addSubview(self.mButton)
    }
    
    override func layoutSubviews() {
        // layoutSubviews内で各Viewの座標やサイズなどを調整する.
        super.layoutSubviews()
        
        self.mView.frame.size = CGSizeMake(300,300)
        self.mView.center.x =  self.center.x
        self.mView.center.y = self.center.y
        
        self.mButton.frame.size = CGSizeMake(100, 40)
        self.mButton.layer.position = CGPoint(x: self.frame.width/2, y:400)
    }
    
    func closeDialog() {
        mDelegate.close()
    }
}
