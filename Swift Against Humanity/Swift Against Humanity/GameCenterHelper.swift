//
//  GameCenterHelper.swift
//  Swift Against Humanity
//
//  Created by Pamela Ocampo on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import GameKit

class GameCenterHelper: NSObject{
    let PresentAuthenticationViewController = "present_authentication_view_controller"
    
    var enableGameCenter: Bool = false
    var authenticationViewController: UIViewController = UIViewController()

    var lastError: NSError = NSError()
    
    class var sharedInstance: GameCenterHelper {
    struct Static {
        static var instance: GameCenterHelper?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = GameCenterHelper()
        }
        
        return Static.instance!
    }
    

    override init() {
        super.init()
        self.enableGameCenter = true
        
    }
    
    func authenticateLocalPlayer(){
        var localPlayer: GKLocalPlayer = GKLocalPlayer()
        
        localPlayer.authenticateHandler = {(viewController : UIViewController!, error : NSError!) -> Void in
            if(error == nil){
                self.setAuthenticationViewController(viewController)
            } else if(localPlayer.authenticated) {
                self.enableGameCenter = true
            } else {
                self.setLastError(error)
                self.enableGameCenter = false
            }
            
        }
    }
    
    func setAuthenticationViewController(authenticationViewController: UIViewController!){
        if (authenticationViewController != nil) {
            self.authenticationViewController = authenticationViewController;
            NSNotificationCenter.defaultCenter().postNotificationName(PresentAuthenticationViewController, object: self)
        }
    }
    
    func setLastError(error: NSError!){
        self.lastError = error
        NSLog("\(error.localizedDescription)")
    }
}