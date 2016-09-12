//
//  DialogViewController.swift
//  CustomDialogSample
//
//  Created by Libra Studio, Inc. on 2015/11/24.
//  Copyright © 2015年 daihase. All rights reserved.
//

import UIKit

class DialogViewController: BaseDialogViewController {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // designated initializer.
     override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nil, bundle: nil)
        
        let dialogView = DialogView()
        mView = dialogView
        dialogView.mDelegate = self
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    // close.
    func dismiss() {
        close()
    }
}
