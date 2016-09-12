//
//  ViewController.swift
//  FadeInFadeOutTransition
//
//  Created by Libra Studio, Inc. on 2015/09/01.
//  Copyright (c) 2015年 Libra Studio, Inc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, AnimationDelegate {
    
    var shape: Shape!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shape = Shape(size: UIScreen.mainScreen().bounds.size)
        self.view.addSubview(shape)
    }
    
    override func viewDidAppear(animated: Bool) {
        Animation.fadeInAnimation(shape, delay: 0.8)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapNextButton(sender: AnyObject) {
        //FadeOut start.
        Animation.Static.delegate = self
        Animation.fadeOutAnimation(self.view, shape: shape, delay: 0.8)
    }
    
    //delegate
    func transition(){
        //SecondViewController
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("second") as! SecondViewController
        self.presentViewController(secondViewController, animated: false, completion: nil)
    }   
}

