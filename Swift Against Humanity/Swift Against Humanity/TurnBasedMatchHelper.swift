//
//  TurnBasedMatchHelper.swift
//  Swift Against Humanity
//
//  Created by Melinda Lu on 9/29/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import Foundation
import GameKit

protocol TurnBasedMatchHelperDelegate {
    func enterNewGame(match: GKTurnBasedMatch)
    func layoutMatch(match: GKTurnBasedMatch)
    func takeTurn(match: GKTurnBasedMatch)
    func receiveEndGame(match: GKTurnBasedMatch)
    func sendNotice(notice: String, forMatch match: GKTurnBasedMatch)
}

// Handles integration with the Game Center turn-based API.
class TurnBasedMatchHelper: NSObject, GKTurnBasedMatchmakerViewControllerDelegate {
    
    var userIsAuthenticated: Bool = false
    var presentingViewController: UIViewController!
    var currentMatch: GKTurnBasedMatch!
    var delegate: TurnBasedMatchHelperDelegate!
    
    // Returns single instance of this class.
    class func sharedInstance() -> TurnBasedMatchHelper {
        struct Static {
            static let instance = TurnBasedMatchHelper()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("authenticationChanged"), name: GKPlayerAuthenticationDidChangeNotificationName, object: nil)
    }

    func authenticateLocalUser() {
        NSLog("Authenticating local user...")
        if GKLocalPlayer.localPlayer().authenticated == false {
            GKLocalPlayer.localPlayer().authenticateHandler = { (vc, error) in
                if (error == nil) {
                    self.userIsAuthenticated = true
                    NSLog("set userIsAuthenticated = true")
                } else {
                    NSLog("\(error.localizedDescription)")
                }
            }
        } else {
            NSLog("Already authenticated!")
            self.userIsAuthenticated = true
            NSLog("set userIsAuthenticated = true")
        }
    }
    
    func authenticationChanged() {
        if GKLocalPlayer.localPlayer().authenticated && !self.userIsAuthenticated {
            NSLog("Authentication changed: player authenticated")
            self.userIsAuthenticated = true
        } else {
            NSLog("Authentication changed: player not authenticated")
            self.userIsAuthenticated = false
        }
    }

    // Presents the matchmaker vc to find a match.
    func findMatch(minPlayers: Int, maxPlayers: Int, viewController: UIViewController) {
        self.presentingViewController = viewController
        
        var request = GKMatchRequest()
        request.minPlayers = minPlayers
        request.maxPlayers = maxPlayers
        
        var mmvc = GKTurnBasedMatchmakerViewController(matchRequest: request)
        mmvc.turnBasedMatchmakerDelegate = self
        mmvc.showExistingMatches = false // This locks the matchmaker view to the number we've selected.
        
        self.presentingViewController.presentViewController(mmvc, animated: true, completion: nil)
    }
    
    
    // MARK: - GKTurnBasedMatchmakerViewControllerDelegate methods
    
    // Fired when the user selects a match from the list of matches.
    // (Match could be one where it's our turn, one where it's someone else's turn, or
    // one where the match has already ended.)
    func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController!, didFindMatch match: GKTurnBasedMatch!) {
        self.presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        NSLog("Did find match /(match)");
        self.currentMatch = match
        let firstParticipant: GKTurnBasedParticipant = match.participants[0] as GKTurnBasedParticipant
        if let turnDate = firstParticipant.lastTurnDate {
            if match.currentParticipant.playerID == GKLocalPlayer.localPlayer().playerID {
                // My turn
                self.delegate.takeTurn(match)
            } else {
                // Someone else's turn; display only
                self.delegate.layoutMatch(match)
            }
        } else {
            // New game
            self.delegate.enterNewGame(match)
        }
    }
    
    // Fired when the cancel button is tapped.
    func turnBasedMatchmakerViewControllerWasCancelled(viewController: GKTurnBasedMatchmakerViewController!) {
        self.presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        // presentingViewController.navigationController?.popViewControllerAnimated(true)
        NSLog("Has cancelled")
    }

    // Fired when there's an error.
    func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController!, didFailWithError error: NSError!) {
        self.presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        NSLog("Error finding match: /(error.localizedDescription)");
    }
    
    // Fired when a player quits a match.
    func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController!, playerQuitForMatch match: GKTurnBasedMatch!) {
        NSLog("Player \(match.currentParticipant) quit for match \(match)")
        // TODO: Handle passing turn on here.
    }
}
