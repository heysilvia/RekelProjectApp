//
//  DetailViewController.swift
//  RekelProjectApp
//
//  Created by Silvia Bormüller on 13.07.15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // Container to store the view table selected object var currentObject : PFObject?
    
        var currentObject : PFObject?
    
    
    
    

    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Unwrap the current object object
        if let object = currentObject {
            labelName.text = object["name"] as! String
           
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
