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
    
    let answers = ["Hello", "World", "Something", "Rather", "Blah", "Blagasdfadf"]
    let colors = [0x44f197,0x309cf7,0xf78930,0x76d459,0x59d499,0x59d4c7,0xe86fb3,0xe86f6f,0x767676]
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView?.registerNib(UINib(nibName: "AnswerCardViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView?.pagingEnabled = true
//        self.collectionView?.registerClass(AnswerCardViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView?.collectionViewLayout = self.collectionViewFlowLayout

        // Do any additional setup after loading the view.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count;
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as AnswerCardViewCell
        
        cell.cardTextLabel.text = answers[indexPath.row]
        cell.backgroundColor = UIColorUtils.UIColorFromRGB(colors[indexPath.row])
//        cell.backgroundColor = UIColor()
        // Configure the cell
    
        return cell
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
