//
//  ViewController.swift
//  Sketch_loadUrlImage
//
//  Created by daihase on 2018/10/17.
//  Copyright © 2018 Libra Studio, Inc. All rights reserved.
//


import UIKit
import Sketch
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var sketchView: SketchView!
    private let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imagUrl = NSURL(string: "https://tech.librastudio.co.jp/wp-content/uploads/2016/01/01.png") as URL? else { fatalError("URL not found") }
        
        imageView.sd_setImage(with: imagUrl, completed: {[weak self](image, err, cacheType, url) in
            self?.sketchView.drawTool = .pen
            self?.sketchView.loadImage(image: self?.imageView.image ?? UIImage())
        })
    }
}
