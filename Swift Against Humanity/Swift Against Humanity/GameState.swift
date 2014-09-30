//
//  GameState.swift
//  Swift Against Humanity
//
//  Created by Melinda Lu on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

enum TurnType {
    case ReloadTurn
    case ProposalTurn
    case EvaluationTurn
}

struct PlayerData {
    let isCardCzar: Bool = false
    let points: Int = 0
    let hand: [Int] = [Int]()
    let cardsPlayed: [Int]?
}

// Everything needed to regenerate the game
class GameState: NSCoding {
    
    // Black deck/white deck indices drawn already
    var blackCardsDrawn = [Int]()
    var whiteCardsDrawn = [Int]()
    
    // This turn's question
    var currentBlackCard: Card?
    
    // Which player ID has been selected winner this round
    var winnerID: String?
    
    // Players (playerId: playerData)
    var players = [String: PlayerData]()
    
    var typeOfTurn = TurnType.ReloadTurn
    
    init(playerIDs: String...) {
        // Initialize players.
        for playerID in playerIDs {
            // The first player gets to be the card czar.
            let isCardCzar = self.players.count == 0 ? true : false
            let playerData = PlayerData(isCardCzar: isCardCzar, points: 0, hand: [Int](), cardsPlayed: nil)
        }
    }
    
    // MARK: - NSCoding implementation
    
    let blackCardsKey = "BlackCardsDrawn"
    let whiteCardsKey = "WhiteCardsDrawn"
    let currentBlackCardKey = "CurrentBlackCard"
    let winnerIDKey = "WinnerID"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(blackCardsDrawn, forKey: blackCardsKey)
        aCoder.encodeObject(whiteCardsDrawn, forKey: whiteCardsKey)
        aCoder.encodeObject(currentBlackCard!, forKey: currentBlackCardKey)
        aCoder.encodeObject(winnerID!, forKey: winnerIDKey)
    }
    
    required init(coder aDecoder: NSCoder) {
        self.blackCardsDrawn = aDecoder.decodeObjectForKey(blackCardsKey) as [Int]
        self.whiteCardsDrawn = aDecoder.decodeObjectForKey(whiteCardsKey) as [Int]
        self.currentBlackCard = aDecoder.decodeObjectForKey(currentBlackCardKey) as? Card
        self.winnerID = aDecoder.decodeObjectForKey(winnerIDKey) as? String
    }
}