//
//  NetworkController.swift
//  War!
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 SteveCox. All rights reserved.
//

import Foundation

class NetworkController {

    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: url) else { completion(data: nil); return }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {( data, _, error) in
            
        
        if let error = error {
        print(error.localizedDescription)
            completion(data: nil)
            return
        }
            
            if let data = data {
            
            print("we have data")
                completion(data: data)
            }

        }
        
        task.resume()

}
    static func jsonFromData(data:NSData, completion: (json: [String: AnyObject]?) -> Void){
        let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
        completion(json: json)
    }
    
    
    
    
    
    
    
    
    
    
    
}