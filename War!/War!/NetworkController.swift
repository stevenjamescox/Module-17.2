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
    
        // STEP 1 = create URL
        guard let url = NSURL(string: url) else {completion (data: nil); return }
        
        // STEP 2 = create our task from the shared instance of NSURLSession
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
        
        // STEP 3 = check if there was an error or not
            if let error = error {
                //print our error description
                print(error.localizedDescription)
                completion(data: nil)
                return
            }
        // STEP 4 = check if we have data or not
            if let data = data {
                // print out that we have data and complete with that data
                print("We have data!")
                completion(data: data)
            }
        }
        //STEP 5 = start the task
    task.resume()
    
    }

}
