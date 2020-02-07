//
//  ImgDelegate.swift
//  dog-bowl
//
//  Created by iMac on 19/8/18.
//  Copyright © 2018 sunny-coast-coders. All rights reserved.
//

// reference https://stackoverflow.com/questions/27995955/saving-picked-image-to-coredata

import Foundation
import UIKit

public protocol ImgDelegate {
    
}

extension ImgDelegate {
    func prepareImageForSaving(image:UIImage) -> NSData? {
        
        //            // scale image,
        //            let thumbnail = image.scale(toSize: self.view.frame.size)

            
            // create NSData from UIImage
        
        guard let imageData = UIImageJPEGRepresentation(image, 1) else {
                // handle failed conversion
                print("jpg error")
                return nil
            }
            
            // return to addeditview
            return imageData as NSData?
            //self.saveImage(imageData, thumbnailData: thumbnailData, date: date)
            
        
    }
}
