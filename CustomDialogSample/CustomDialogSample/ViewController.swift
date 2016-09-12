//
//  ViewController.swift
//  CustomDialogSample
//
//  Created by Libra Studio, Inc. on 2015/11/24.
//  Copyright © 2015年 daihase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func show(sender: AnyObject) {
        let dialog = DialogViewController()
        dialog.show()
    }
}

