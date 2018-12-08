//
//  PSPhotoManager.swift
//  Sketch_saveAlbum
//
//  Created by daihase on 2018/12/08.
//  Copyright © 2018 jp.co.librastudio. All rights reserved.
//

import UIKit
import Photos

public enum PhotoLibraryState {
    case authorized
    case denied
    case notDetermined
    case restricted
}

protocol PSPhotoManagerDelegate {
    func successSaveImage()
}

class PSPhotoManager {
    private init(){}
    static let shared = PSPhotoManager ()
    var delegate: PSPhotoManagerDelegate?
    
    func Authorization( completion: @escaping (Bool) -> Void)  {
        PHPhotoLibrary.requestAuthorization {(status) -> Void in
            switch(status){
            case .authorized:
                print("Authorized")
                completion(true)
            case .denied:
                print("Denied")
                completion(false)
            case .notDetermined:
                print("NotDetermined")
                completion(false)
            case .restricted:
                print("Restricted")
                completion(false)
            }
        }
    }
    
    // Create Photo Album
    func createAlbum(albumName: String, targetView: UIView) -> Void {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        if collection.firstObject != nil {
          // If you already have an album of "Sample_App"
            print("[\(albumName)] already exist")
            self.saveCanvasToAlbum(targetView)
        }else{
            // If not generated
            PHPhotoLibrary.shared().performChanges({
                PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)
            }, completionHandler: { (isSuccess, error) in
                if isSuccess == true {
                    print("Success")
                    self.saveCanvasToAlbum(targetView)
                }
                else{
                    print("Error occured")
                }
            })
        }
    }
    
    // Save the Canvas screen capture on the album
    func saveCanvasToAlbum(_ targetView: UIView) {
        var theAlbum: PHAssetCollection?
        
        // Search Album
        let result = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.album,
                                                             subtype: PHAssetCollectionSubtype.any,
                                                             options: nil)
        result.enumerateObjects({ (object, index, stop) in
            if object.localizedTitle == "Sample_App" {
                theAlbum = object
            }
        })
        
        // Create UIImage from UIView
        let captureImage = Utilities.shared.getScreenCapture(targetView: targetView)
        
        if let anAlbum = theAlbum {
            // Save the capture there if there is an album of Sample_App
            PHPhotoLibrary.shared().performChanges({
                let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: captureImage)
                _ = assetChangeRequest.placeholderForCreatedAsset
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: anAlbum)
                
                let fastEnumeration = NSArray(array: [assetChangeRequest.placeholderForCreatedAsset!] as [PHObjectPlaceholder])
                
                albumChangeRequest!.addAssets(fastEnumeration)
            }, completionHandler: {(success, error) -> Void in
                self.delegate?.successSaveImage()
            })
        }
    }
}
