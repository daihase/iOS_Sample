//
//  ViewController.swift
//  DateExtension
//
//  Created by daihase on 2018/06/16.
//  Copyright © 2018年 daihase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let dateAndTime = date.formattedDateWith(style: .longDateAndTime)
        print(date.format(with: "yyyy年MM月dd日(E) a h:mm:ss.SSS"))
        dateLabel.text = dateAndTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
