//
//  Card.swift
//  Swift Against Humanity
//
//  Created by Daniel Valencia on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation

class Card {
    let text:String
    var selected:Bool
    let baseColor:Int
    
    init(text: String, baseColor: Int) {
        self.text = text
        self.selected = false
        self.baseColor = baseColor
    }
}