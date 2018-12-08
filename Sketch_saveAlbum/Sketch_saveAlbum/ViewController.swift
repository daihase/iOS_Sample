//
//  ViewController.swift
//  Sketch_saveAlbum
//
//  Created by daihase on 2018/12/08.
//  Copyright © 2018 jp.co.librastudio. All rights reserved.
//

import UIKit
import Sketch

class ViewController: UIViewController {
    private var sketchView = SketchView(frame: CGRect(x: 0,
                                                      y: 0,
                                                      width: UIScreen.main.bounds.width,
                                                      height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add sketch view
        self.view.addSubview(sketchView)
        
        // Create save button
        let saveButton: UIButton = {
            let button = UIButton(frame: CGRect(x: (view.bounds.width - 100) / 2,
                                                y: view.bounds.height - 100,
                                                width: 100,
                                                height: 50))
            button.layer.cornerRadius = 10
            button.backgroundColor = .red
            button.setTitle("Save", for: .normal)
            button.addTarget(self, action: #selector(tapSaveButton(_:)), for: .touchUpInside)
            return button
        }()
        self.view.addSubview(saveButton)
        
    }
    
    @objc private func tapSaveButton(_ sender: UIButton) {
        PSPhotoManager.shared.Authorization {(completion: Bool) -> Void in
            if completion {
                PSPhotoManager.shared.createAlbum(albumName: "Sample_App",
                                                  targetView: self.sketchView)
                PSPhotoManager.shared.delegate = self
            } else {
                DispatchQueue.main.async {
                    Utilities.showAlert(title: "Error",
                                        message: "message...",
                                        cancel: nil,
                                        destructive: nil,
                                        others: ["OK"],
                                        parent: self) {
                                            (buttonIndex: Int) in
                    }
                }
            }
        }
    }
}

extension ViewController: PSPhotoManagerDelegate {
    func successSaveImage() {
        Utilities.showAlert(title: "Confirm",
                            message: "Success!",
                            cancel: nil,
                            destructive: nil,
                            others: ["OK"],
                            parent: self) {
                                (buttonIndex: Int) in
        }
    }
}
