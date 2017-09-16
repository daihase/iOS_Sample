//
//  PopupViewController.swift
//  PopupViewSample
//
//  Created by daihase on 2017/09/17.
//  Copyright © 2017年 librastudio, Inc. All rights reserved.
//

import UIKit

protocol PopupViewControllerDelegate {
    func closeDialog()
}

class PopupViewController: UIViewController {
    var delegate: PopupViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        self.delegate?.closeDialog()
    }
}
