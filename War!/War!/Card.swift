//
//  Card.swift
//  War!
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 SteveCox. All rights reserved.
//

import Foundation

class Card {

    private let kValue = "value"
    private let kImage = "image"
    private let kSuit = "suit"
    
    let value: String
    let imageURLString: String
    let suit: String
    
    var intValue: Int {
        switch value {
        case "ACE":
            return 14
        case "KING":
            return 13
        case "QUEEN":
            return 12
        case "JAKE":
            return 11
        default:
             return Int(value)!
        }
    
    
    
    
    }
    
    
    
    init(value: String, imageUrl: String, suit: String) {
    self.value = value
    self.imageURLString = imageUrl
    self.suit = suit
    
    }

    init?(jsonDictionary: [String: AnyObject]) {
        guard let value = jsonDictionary[kValue] as? String,
        let imageURLString = jsonDictionary[kImage] as? String,
            let suit = jsonDictionary[kSuit] as? String else { return nil }
        
        self.value = value
        self.imageURLString = imageURLString
        self.suit = suit
    
    }
    
    
    
    
}