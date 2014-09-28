//
//  Card.swift
//  Swift Against Humanity
//
//  Created by melinda on 9/27/14.
//

import Foundation

enum CardColor {
    case White
    case Black
}

class Card {
    let color: CardColor
    let contents: String
    var hasBeenDrawn: Bool = false
    var selected: Bool = false
    
    init(color: CardColor, contents: String) {
        self.color = color
        self.contents = contents
    }
}