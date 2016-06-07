//
//  CardController.swift
//  War!
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 SteveCox. All rights reserved.
//

import Foundation

class CardController {

    private static let baseUrl = "http://deckofcardsapi.com/api/deck/new/draw/?count="

    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void){
        // Step 1 = get/make my complete url
        let url = baseUrl + String(numberOfCards)
        
        // Step 2 = use that complete url to get data from the network by passing it into our dataAtUrl function we created on the NetworkController
        
        NetworkController.dataAtURL(url) { (data) in
            
            // Step 3 = i have my data, hopefully it's not nil, let's check, complete with [] if not
            guard let data = data else { completion(cards: []); return}
            
            // Step 4 = I have my data, convert to json by passing it through jsonFromData func in NetworkController
            NetworkController.jsonFromData(data, completion: { (json) in
                
            // Step 5 = Make sure that the json variable passed back in the completion actually has something in it
            // Step 6 = we go to the specific key in the json we want to read from (in our case it's the "cards" key to go get Array of dictionaries of type [String: AnyObject])
                
                guard let json = json, cardArray = json["cards"] as? [[String: AnyObject]] else { completion(cards: []) ; return }
            // Step 7 = create new instances of our model objects from the array of data (usually a dictionary by flatMapping that array. (in our case we're creating new cards by calling the failable initializer in Card model which wants us to pass in a dictionary. we can do that because our cardArray is an array of dictionaries)
                
                let cards = cardArray.flatMap({Card(jsonDictionary: $0)})
            // Step 8 = complete with the array of cards we just created
                completion(cards: cards)
            })
        }
    }
}