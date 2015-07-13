//
//  ProfileEditViewController.swift
//  RekelProjectApp
//
//  Created by Silvia Bormüller on 09.07.15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit



class ProfileEditViewController: UIViewController {
     // Container to store the current user
     var currentUser : PFUser?
    

    
    
    @IBOutlet weak var usersnameEditTextfield: UITextField!
    
    @IBOutlet weak var firstnameEditTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Unwrap the current object object
        if let object = currentUser {
            usersnameEditTextfield.text = object["usersname"] as! String
            firstnameEditTextfield.text = object["firstname"] as! String
            
            NSLog("current user", currentUser!)
            
            
           
        }
        
        
        

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func userProfileSaveButton(sender: AnyObject) {
        
        if let object = currentUser {
            
            object["usersname"] = usersnameEditTextfield.text
            object["firstname"] = firstnameEditTextfield.text
           
            
            // Save the data back to the server in a background task
          //object.saveEventually(nil)
            
            object.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                   NSLog("user created")
                } else {
                    // There was a problem, check error.description
                    
                    println(error)
                }
            }
       // object.ACL = PFACL(user: PFUser.currentUser()!)
            
            
            //perform segue to tableview
           
            
        }
        
         self.performSegueWithIdentifier("profileToTableView", sender: self)
    }
   

}
