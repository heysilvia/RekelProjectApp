//
//  SignInViewController.swift
//  RekelProjectApp
//
//  Created by Silvia Bormüller on 08.07.15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          activityIndicator.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signInDidPress(sender: AnyObject) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        var userEmailAddress = emailTextField.text
        userEmailAddress = userEmailAddress.lowercaseString
        
        var userPassword = passwordTextField.text
        
        PFUser.logInWithUsernameInBackground(userEmailAddress, password:userPassword) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier("signInToTableView", sender: self)
                }
            } else {
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                }
            }
        }
    }
    

}
