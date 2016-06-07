//
//  ImageController.swift
//  War!
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 SteveCox. All rights reserved.
//

import Foundation
import UIKit

class ImageController {

    static func imageForURL(url: String, completion: (image: UIImage?) -> Void) {
        NetworkController.dataAtURL(url) { (data) in
            guard let data = data else { completion(image: nil); return }
            let image = UIImage(data: data)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
            completion(image: image)
        })
    
    
    }

}
}