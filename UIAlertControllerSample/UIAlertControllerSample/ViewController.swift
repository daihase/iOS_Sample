//
//  ViewController.swift
//  UIAlertControllerSample
//
//  Created by daihase on 2016/11/29.
//  Copyright © 2016年 daihase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let alertTitle = "Title"
    let alertMessage = "message1\nmessage2"
    let positiveButtonText = "OK"
    let negativeButtonText = "Cancel"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // View呼び出し.
    @IBAction func tapAlertButon(_ sender: Any) {
        
        /*
         let alert = UIAlertController(title: self.alertTitle, message: self.alertMessage, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: self.positiveButtonText, style: .default, handler: nil))
         alert.addAction(UIAlertAction(title: self.negativeButtonText, style: .cancel, handler: nil))
         present(alert, animated: true, completion: nil)
         */

        Util.sharedInstance.showAlertView(title: self.alertTitle , message: self.alertMessage, actionTitles: [self.negativeButtonText, self.positiveButtonText], actions: [
            {()->() in
                print(self.negativeButtonText)
            },
            {()->() in
                // YESを押した場合はその後、通信処理などを
                print(self.positiveButtonText)
            }]
        )
    }
}

