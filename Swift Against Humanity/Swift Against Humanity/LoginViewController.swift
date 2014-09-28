//
//  ViewController.swift
//  Swift Against Humanity
//
//  Created by Daniel Valencia on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "loginToGameSegue"{
            let vc = segue.destinationViewController as GameController
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func touchedLoginButton(sender: AnyObject) {
        GCHelper.sharedInstance.authenticateLocalUser()
        if (GCHelper.sharedInstance.authenticated) {
         self.performSegueWithIdentifier("loginToGameSegue", sender: self)
        }
        
    }
}

