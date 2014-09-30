//
//  Game.swift
//  Swift Against Humanity
//
//  Created by Melinda Lu on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func getSelectedAnswers() -> [Int]
    func presentEvaluation()
}

class Game {
    
    var delegate: GameDelegate!
    
    // Same for everyone (keep in sync with each turn)
    var blackDeck = Deck.blackDeck
    var whiteDeck = Deck.whiteDeck
    
    var currentGameState: GameState
    
    let myPlayerID: String
    
    init(playerID: String, delegate: GameDelegate) {
        self.myPlayerID = playerID
        self.delegate = delegate
        self.currentGameState = GameState()
    }
    
    // Lots of different things could happen during a turn.
    func takeTurn() {
        var possiblyMe = self.currentGameState.players[myPlayerID]
        if let me = possiblyMe {
            switch (self.currentGameState.typeOfTurn, me.isCardCzar) {
            case (.ReloadTurn, _):
                takeReloadTurn(me)
            case (.ProposalTurn, true):
                skipTurn()
            case (.ProposalTurn, false):
                takeProposalTurn(me)
            case (.EvaluationTurn, true):
                takeEvaluationTurn(me)
            case (.EvaluationTurn, false):
                skipTurn()
            default:
                skipTurn()
            }
        }
    }
    
    func saveAndSendCurrentState() {
        NSLog("State sent.")
    }
    
    // Everyone does this (1) at the start of the game, and
    // (2) after one full round of each of proposal/evaluation terms.
    // This refills hands and clears played cards.
    func takeReloadTurn(playerData: PlayerData) {
        
        var hand = playerData.hand
        
        while hand.count < 10 {
            if let cardIndex = whiteDeck.nextCardIndex() {
                hand.append(cardIndex)
            }
        }
        
        let myPlayerData = PlayerData(isCardCzar: playerData.isCardCzar, points: playerData.points, hand: hand, cardsPlayed: nil)
        self.currentGameState.players[self.myPlayerID] = myPlayerData
        saveAndSendCurrentState()
    }
    
    // Only non-card-czars do this.
    // This is where we select answer(s) to propose.
    func takeProposalTurn(playerData: PlayerData) {
        let cardIndicesSelected = self.delegate.getSelectedAnswers()
        
        let myPlayerData = PlayerData(isCardCzar: playerData.isCardCzar, points: playerData.points, hand: playerData.hand, cardsPlayed: cardIndicesSelected)
        self.currentGameState.players[self.myPlayerID] = myPlayerData
        saveAndSendCurrentState()
    }
    
    // Only card czars take this.
    // This is where we choose a best answer.
    // Scores also get updated here.
    func takeEvaluationTurn(playerData: PlayerData) {
        self.delegate.presentEvaluation()
    }
    
    func skipTurn() { }
}