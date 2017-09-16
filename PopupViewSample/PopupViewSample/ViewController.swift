//
//  ViewController.swift
//  PopupViewSample
//
//  Created by daihase on 2017/09/16.
//  Copyright © 2017年 librastudio, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapPopupButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopupViewController", bundle: nil)
        let popupViewController = storyboard.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        popupViewController.delegate = self
        
        // ポップアップ表示
        UIWindow.createNewWindow(popupViewController).open()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: PopupViewControllerDelegate {
    // ポップアップ閉じる
    func closeDialog() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window else {
            return
        }
        
        window.close()
    }
}

