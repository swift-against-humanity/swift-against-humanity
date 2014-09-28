//
//  Card.swift
//  Swift Against Humanity
//
<<<<<<< HEAD
//  Created by Daniel Valencia on 9/27/14.
=======
//  Created by melinda on 9/27/14.
>>>>>>> origin/master
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

<<<<<<< HEAD
class Card {
    let text:String
    var selected:Bool
    let baseColor:Int
    
    init(text: String, baseColor: Int) {
        self.text = text
        self.selected = false
        self.baseColor = baseColor
=======
enum CardColor {
    case White
    case Black
}

class Card {
    let color: CardColor
    let contents: String
    var hasBeenDrawn: Bool = false
    
    init(color: CardColor, contents: String) {
        self.color = color
        self.contents = contents
>>>>>>> origin/master
    }
}