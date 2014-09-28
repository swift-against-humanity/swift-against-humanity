//
//  GameController.swift
//  Swift Against Humanity
//
//  Created by Pamela Ocampo on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//
import UIKit
import GameKit

class GameController: UIViewController, GCHelperDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func newGameTouched(sender: AnyObject) {
        GCHelper.sharedInstance.findMatchWithMinPlayers(4, maxPlayers: 4, viewController: self, delegate: self)
    }
    
    func matchStarted(){
        println("match started")
    }
    func match(match: GKMatch, didReceiveData: NSData, fromPlayer: String){
        println(match)
    }
    func matchEnded(){
        
    }

    
}