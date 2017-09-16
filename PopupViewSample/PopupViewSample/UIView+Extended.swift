//
//  UIView+Extended.swift
//  PopupViewSample
//
//  Created by daihase on 2017/09/16.
//  Copyright © 2017年 librastudio, Inc. All rights reserved.
//

import UIKit

fileprivate var windowStackArray: [UIWindow] = []
fileprivate var animationDuration: TimeInterval = 0.4

extension UIWindow {
    
    public static var windowStack: [UIWindow] {
        return windowStackArray
    }
    
    open static func createNewWindow(_ rootViewController: UIViewController) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.alpha = 0.0;
        window.windowLevel = UIWindowLevelNormal;
        window.rootViewController = rootViewController
        
        return window
    }
    
    open func open(_ animation: ((_ window: UIWindow) -> Void)? = nil) {
        guard let root = rootViewController else {
            return
        }
        
        self.alpha = 0.0
        root.view.frame.origin = CGPoint(x: 0.0, y: 0.0)
        addSubview(root.view)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        if windowStackArray.count == 0 {
            windowStackArray.append(appDelegate.window!)
        }
        
        let nowWindow = appDelegate.window
        nowWindow?.rootViewController?.viewWillDisappear(true)
        
        windowStackArray.append(self)
        appDelegate.window = self
        self.makeKeyAndVisible()
        
        if let animation = animation {
            animation(self)
        } else {
            UIView.transition(with: self, duration: animationDuration, options: [.transitionCrossDissolve, .curveLinear], animations:
                { () -> Void in
                    self.alpha = 1.0
                    self.transform = CGAffineTransform.identity
                    
            }, completion: { (finished) in
                nowWindow?.rootViewController?.viewDidDisappear(true)
            })
        }
    }
    
    open func close(_ animation: ((_ window: UIWindow) -> Void)? = nil, completion: ((Bool) -> Swift.Void)? = nil) {
        guard let idx = windowStackArray.index(of: self) else {
            return
        }
        
        if windowStackArray.count <= 1 {
            return
        }
        
        let beforeWindow = windowStackArray[idx - 1]
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        windowStackArray.remove(at: idx)
        
        if beforeWindow == windowStackArray.last {
            appDelegate.window = beforeWindow
            beforeWindow.rootViewController?.viewWillAppear(true)
        }
        
        if let animation = animation {
            animation(beforeWindow)
        } else {
            UIView.transition(with: self, duration: animationDuration, options: [.transitionCrossDissolve, .curveLinear], animations:
                { () -> Void in
                    self.alpha = 0.0
                    self.transform = CGAffineTransform.identity
            }, completion: { (finished) in
                self.rootViewController?.view.removeFromSuperview()
                self.removeFromSuperview()
                if beforeWindow == windowStackArray.last {
                    beforeWindow.makeKeyAndVisible()
                    beforeWindow.rootViewController?.viewDidAppear(true)
                }
                completion?(finished)
            })
        }
    }
}
