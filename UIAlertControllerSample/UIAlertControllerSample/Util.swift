//
//  Util.swift
//  UIAlertControllerSample
//
//  Created by daihase on 2016/11/29.
//  Copyright © 2016年 daihase. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    var rootWindow: UIWindow!
    
    // Singleton.
    class var sharedInstance: Util {
        struct Static {
            static let instance: Util = Util()
        }
        return Static.instance
    }
    
    private override init() {}
    
    // show alert.
    func showAlertView(
        title: String? = nil,
        message: String,
        actionTitles: [String],
        actions: [() -> ()]?) {
        // create new window.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.clear
        window.rootViewController = UIViewController()
        Util.sharedInstance.rootWindow = UIApplication.shared.windows[0]
        //create alertview.
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        for title in actionTitles {
            //add action.
            let action = UIAlertAction(title: title, style: .default, handler: { (action : UIAlertAction) -> Void in
                if let acts = actions {
                    if acts.count >= actionTitles.count {
                        acts[actionTitles.index(of: title)!]()
                    }
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    alert.dismiss(animated: true, completion: nil)
                    window.isHidden = true
                    window.removeFromSuperview()
                    Util.sharedInstance.rootWindow.makeKeyAndVisible()
                })
            })
            alert.addAction(action)
        }
        
        window.windowLevel = UIWindowLevelAlert
        window.makeKeyAndVisible()
        window.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
