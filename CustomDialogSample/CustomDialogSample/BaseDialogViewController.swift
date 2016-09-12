//
//  BaseDialogViewController.swift
//  CustomDialogSample
//
//  Created by Libra Studio, Inc. on 2015/11/24.
//  Copyright © 2015年 daihase. All rights reserved.
//

import UIKit

class BaseDialogViewController: UIViewController {
    var mView: UIView!
    private var kAssocKey_Window: UInt8 = 0
    var window:UIWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
        self.view = mView
    }
    
    // ダイアログ開く.
    func show() {
        window = UIWindow()
        window.alpha = 0
        window.transform = CGAffineTransformMakeScale(1, 1)
        window.rootViewController = self
        window.backgroundColor = UIColor.clearColor()
        window.windowLevel = UIWindowLevelNormal + 5
        window.makeKeyAndVisible()
        
        objc_setAssociatedObject(UIApplication.sharedApplication(), &kAssocKey_Window, window, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        UIView.transitionWithView(window, duration: 0.2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            self.window.alpha = 1
            self.window.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: { (finished: Bool) -> () in
        })
    }
    
    // ダイアログ閉じる.
    func close() {
        
        UIView.transitionWithView(window, duration: 0.2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            // アニメーション処理.
            let view = self.window.rootViewController!.view
            for views in view.subviews {
                views.transform = CGAffineTransformMakeScale(0.9, 0.9)
            }
            self.window.alpha = 0
            
            }, completion: { (finished: Bool) -> () in
                self.window.rootViewController!.view.removeFromSuperview()
                self.window.rootViewController = nil
                // 上乗せしたウィンドウを破棄.
                objc_setAssociatedObject(UIApplication.sharedApplication(), &self.kAssocKey_Window, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                // メインウィンドウをキーウィンドウにする.
                let nextWindow = UIApplication.sharedApplication().delegate!.window
                nextWindow!!.makeKeyAndVisible()
        })
    }
}
