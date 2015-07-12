//
//  SignUpViewController.swift
//  RekelProjectApp
//
//  Created by Silvia Bormüller on 08.07.15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

//github test

//github commit test2

import UIKit

class SignUpViewController: UIViewController {
    

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func signUp(sender: AnyObject) {
        
        // Build the terms and conditions alert
        let alertController = UIAlertController(title: "Agree to terms and conditions",
            message: "Click I AGREE to signal that you agree to the End User Licence Agreement.",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        alertController.addAction(UIAlertAction(title: "I AGREE",
            style: UIAlertActionStyle.Default,
            handler: { alertController in self.processSignUp()})
        )
        alertController.addAction(UIAlertAction(title: "I do NOT agree",
            style: UIAlertActionStyle.Default,
            handler: nil)
        )
        
        // Display alert
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        message.hidden = true


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func processSignUp() {
        
        var userEmailAddress = emailField.text
        var userPassword = passwordField.text
        
        // Ensure username is lowercase
        userEmailAddress = userEmailAddress.lowercaseString
        
        // Add email address validation
        
        // Start activity indicator
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        // Create the user
        var user = PFUser()
        user.username = userEmailAddress
        user.password = userPassword
        user.email = userEmailAddress
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if error == nil {
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier("signUpToProfile", sender: self)
                }
                
            } else {
                
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                    self.message.hidden = false
                }				
            }
        }
    }

}
