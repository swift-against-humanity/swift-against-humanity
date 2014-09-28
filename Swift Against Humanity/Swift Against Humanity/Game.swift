//
//  Game.swift
//  Swift Against Humanity
//
//  Created by melinda on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

class Game {
    
    // full player data
    class Player {
        let playerId: String
        var isCardCzar: Bool = false
        var points: Int = 0
        var hand: [Int] = [Int]()
        var cardsPlayed: [Int] = [Int]()
        
        init(playerId: String) {
            self.playerId = playerId
        }
        
        func drawHand() {
        }
    }

    // Same for everyone
    // Keep in sync with each turn
    var blackDeck = Deck.blackDeck
    var whiteDeck = Deck.whiteDeck
    
    // Full player data for just me
    var myself: Player
    
    init(playerID: String) {
        myself = Player(playerId: playerID)
    }
    
    // Everything happens here
    func takeTurn() -> TurnData? {
        return nil
    }
}