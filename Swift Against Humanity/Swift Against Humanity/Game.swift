//
//  Game.swift
//  Swift Against Humanity
//
//  Created by melinda on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

enum CardColor {
    case White
    case Black
}

struct Card {
    let color: CardColor
    let contents: String
}

class Deck {
    let color: CardColor
    var cards: [Card] = [Card]()
    
    init(color: CardColor) {
        self.color = color
        switch self.color {
        case .White:
            self.cards = generateWhiteCards()
        case .Black:
            self.cards = generateBlackCards()
        }
    }
    
    func generateWhiteCards() -> [Card] {
        cards = [Card(color: CardColor.White, contents: "hello"),
            Card(color: CardColor.White, contents: "hello")]
        return cards
    }
    
    func generateBlackCards() -> [Card] {
        return [Card]()
    }
    
    func drawNextCard() -> Card? {
        if let card = self.cards.first {
            cards.removeAtIndex(0)
            return card
        } else {
            // TODO: No cards left in deck
            return nil
        }
    }
}

let blackDeck = Deck(color: CardColor.Black)
let whiteDeck = Deck(color: CardColor.White)

class Player {
    let name: String
    var isCardCzar: Bool = false
    var points: Int = 0
    var hand: [Card] = [Card]()
    
    init(name: String) {
        self.name = name
        for i in 1...10 {
            if let card = whiteDeck.drawNextCard() {
                self.hand.append(card)
            }
        }
    }
}

