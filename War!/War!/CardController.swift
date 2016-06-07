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

    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void) {
        let url = self.baseUrl + String(numberOfCards)
        NetworkController.dataAtURL(url) { (data) in
        guard let data = data else { completion(cards: []); return }
            NetworkController.jsonFromData(data, completion: { (json) in
                guard let json = json, cardArray = json["cards"] as? [[String: AnyObject]] else { completion(cards: []); return }
                let cards = cardArray.flatMap({Card(jsonDictionary: $0)})
            })
        }
    }
}