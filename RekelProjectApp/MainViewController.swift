//
//  MainViewController.swift
//  RekelProjectApp
//
//  Created by Chris Kong on 7/12/15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
  // NSUserDefaults and Walkthrough
//  let userDefaults = NSUserDefaults.standardUserDefaults()
//  let hasViewedWalkthrough = userDefaults.boolForKey("hasViewedWalkthrough")
//  
//  if hasViewedWalkthrough == false {
//    if let pageViewController = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? PageViewController {
//    self.presentViewController(pageViewController, animated: true, completion: nil)
//  }
  
  // MARK: View Controller's Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Need to check
    if let pageViewController = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? PageViewController {
      self.presentViewController(pageViewController, animated: true, completion: nil)
    }
  }
  
  

}