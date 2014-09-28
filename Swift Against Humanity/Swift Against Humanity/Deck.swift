//
//  Deck.swift
//  Swift Against Humanity
//
//  Created by melinda on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

class Deck {
    
    let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    // MARK: Static decks
    
    struct StaticDecks {
        static var blackDeck: Deck?
        static var whiteDeck: Deck?
    }
    
    class var whiteDeck: Deck {
    if StaticDecks.whiteDeck == nil {
        StaticDecks.whiteDeck = Deck(cards: loadCards(CardColor.White))
        }
        return StaticDecks.whiteDeck!
    }
    
    class var blackDeck: Deck {
    if StaticDecks.blackDeck == nil {
        StaticDecks.blackDeck = Deck(cards: loadCards(CardColor.Black))
        }
        return StaticDecks.blackDeck!
    }
    
    class func loadCards(cardColor: CardColor) -> [Card] {
        var cards = [Card]()
        let fileName = cardColor == CardColor.Black ? "Questions" : "Answers"
        let possiblePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")
        if let path = possiblePath {
            var possibleContent = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)

            if let content = possibleContent {
                var lines = content.componentsSeparatedByString("\n")
                
                for line in lines {
                    cards.append(Card(color: cardColor, contents: line))
                    let colorString = cardColor == CardColor.Black ? "black" : "white"
                    NSLog("Added card to \(colorString) deck: \(line)")
                }
            }
        }
        return cards
    }
    
    // MARK: Instance functionality
    
    func nextCardIndex() -> Int? {
        
        func random(max: Int) -> Int {
            return Int(arc4random_uniform(UInt32(max)))
        }
        
        let count = self.cards.count
        var index: Int
        
        // TODO: check if all cards have been drawn already
        
        // Super hacky
        while true {
            index = random(count)
            let card = self.cards[index]
            if !card.hasBeenDrawn {
                card.hasBeenDrawn = true
                return index
            }
        }
    }
    
}