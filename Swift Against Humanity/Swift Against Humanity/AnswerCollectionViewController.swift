//
//  AnswerCollectionViewController.swift
//  Swift Against Humanity
//
//  Created by Daniel Valencia on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import UIKit

let reuseIdentifier = "AnswerCardCell"

class AnswerCollectionViewController: UICollectionViewController {
    
//    let answers = ["Hello", "World", "Something", "Rather", "Blah", "Blagasdfadf"]
    var answers = [Card(text: "Hello", baseColor: 0x44f197),
                   Card(text: "World", baseColor:0x309cf7 ),
                   Card(text: "Something", baseColor: 0xf78930),
                   Card(text: "Rather", baseColor: 0x76d459),
                   Card(text: "Blah", baseColor: 0x59d499),
                   Card(text: "asdfasdfasdf", baseColor: 0x59d4c7),
                   Card(text: "something", baseColor: 0x44f197),
                   Card(text: "asdfasd", baseColor:0x309cf7 ),
                   Card(text: "asdfasd", baseColor: 0xf78930),
                   Card(text: "asdfasdf", baseColor: 0x76d459)]
        
    let question = "What are my parents hiding from me ?"
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView?.registerNib(UINib(nibName: "AnswerCardViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.whiteColor()
//        self.collectionView?.pagingEnabled = true
//        self.collectionView?.registerClass(AnswerCardViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView?.collectionViewLayout = self.collectionViewFlowLayout

        // Do any additional setup after loading the view.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count + 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as AnswerCardViewCell
        
        if indexPath.row == 0 {
            //It's the question
            cell.cardTextLabel.text = question
            cell.backgroundColor = UIColor.blackColor()
            cell.cardTextLabel.textColor = UIColor.whiteColor()
            cell.typeLabel.text = "Question"
        } else {
            let index = indexPath.row - 1
            let card = answers[index]
            
            if card.selected {
                cell.backgroundColor = UIColorUtils.UIColorFromRGB(0xf7f7f7)
                cell.cardTextLabel.textColor = UIColor.blackColor()
                cell.typeLabel.textColor = UIColor.blackColor()
                cell.selectedButton.hidden = false
            } else {
                cell.backgroundColor = UIColorUtils.UIColorFromRGB(card.baseColor)
                cell.cardTextLabel.textColor = UIColor.whiteColor()
                cell.typeLabel.textColor = UIColor.whiteColor()
                cell.selectedButton.hidden = true
            }
            cell.cardTextLabel.text = card.text
            cell.typeLabel.text = "Answer"
        }
//        cell.backgroundColor = UIColor()
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            
        } else {
            let card = answers[indexPath.row - 1]
            if card.selected {
                card.selected = false
            } else {
                for answer in answers {
                    answer.selected = false
                }
                card.selected = true
            }
            self.collectionView?.reloadData()
        }
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    func collectionView(collectionView: UICollectionView!, shouldHighlightItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    func collectionView(collectionView: UICollectionView!, shouldSelectItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(collectionView: UICollectionView!, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, canPerformAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, performAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) {
    
    }
    */
    
}
