//
//  TurnData.swift
//  Swift Against Humanity
//
//  Created by melinda on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

class TurnData {
    
    struct PlayerTurnData {
        let playerID: Int
        let isCardCzar: Bool
        let cardsPlayed: [Card]
    }
    
    // black card if already chosen
    var blackCard: Card?
    
    var playersTurnData = [PlayerTurnData]()
    
    // What type of turn this is (enum)
    
}