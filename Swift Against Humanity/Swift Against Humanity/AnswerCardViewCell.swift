//
//  AnswerCardViewCell.swift
//  Swift Against Humanity
//
//  Created by Daniel Valencia on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import UIKit

class AnswerCardViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardTextLabel: UILabel!
    
    override func awakeFromNib() {
        NSLog("Awaking from nib")
    }
}
