//
//  ViewController.swift
//  Swift Against Humanity
//
//  Created by Daniel Valencia on 9/27/14.
//  Copyright (c) 2014 Daniel Valencia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var personSlider: UISlider!
    @IBOutlet weak var playerCountLabel: UILabel!

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if segue.identifier == "answerSegue"{
//            let vc = segue.destinationViewController as GameController
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        personSlider.continuous = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSliderValueChanged(sender: AnyObject) {
        let slider = sender as UISlider
        let value = slider.value
        let roundedValue = lroundf(value)
        playerCountLabel.text = "\(roundedValue)"
        slider.value = Float(roundedValue)
    }
    
    @IBAction func touchedLoginButton(sender: AnyObject) {
//        GCHelper.sharedInstance.authenticateLocalUser()
        
        self.performSegueWithIdentifier("answerCollectionSegue", sender: self)
        
        
    }
}

