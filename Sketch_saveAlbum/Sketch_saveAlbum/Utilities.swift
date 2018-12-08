//
//  Utilities.swift
//  Sketch_saveAlbum
//
//  Created by daihase on 2018/12/08.
//  Copyright © 2018 jp.co.librastudio. All rights reserved.
//
import UIKit

class Utilities {
    private init() {}
    static let shared = Utilities()
    
    class func showAlert (title: String?, message: String?, cancel: String?, destructive: [String]?, others: [String]?, parent: UIViewController, callback: @escaping (Int) -> ()) {
        if title == nil && message == nil && cancel == nil && destructive == nil && others == nil {
            return
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if cancel != nil {
            let cancelAction = UIAlertAction(title: cancel!, style: .cancel) {
                action in callback(0)
            }
            alertController.addAction(cancelAction)
        }
        
        let destructivOffset = 1
        var othersOffset = destructivOffset
        
        if destructive != nil {
            for i in 0..<destructive!.count {
                let destructiveAction = UIAlertAction(title: destructive![i], style: .destructive) {
                    action in callback(i + destructivOffset)
                }
                alertController.addAction(destructiveAction)
                
                othersOffset += 1
            }
        }
        
        if others != nil {
            for i in 0..<others!.count {
                let otherAction = UIAlertAction(title: others![i], style: .default) {
                    action in callback(i + othersOffset)
                }
                alertController.addAction(otherAction)
            }
        }
        
        parent.present(alertController, animated: true, completion: nil)
    }
    
    // Create UIImage from UIView
    func getScreenCapture(targetView: UIView, rect: CGRect? = nil) -> UIImage {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(targetView.frame.size, false, scale)
        targetView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return screenshot!
    }
}
