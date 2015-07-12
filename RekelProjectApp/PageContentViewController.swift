//
//  PageContentViewController.swift
//  RekelProjectApp
//
//  Created by Chris Kong on 7/12/15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController
{
  // MARK: Outlets
  
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var contentImageView: UIImageView!
  @IBOutlet weak var subHeadingLabel: UILabel!
  @IBOutlet weak var headingLabel: UILabel!
  @IBOutlet weak var registerButton: UIButton!
  @IBOutlet weak var signInButton: UIButton!
  @IBOutlet weak var justBrowseButton: UIButton!
  
  var index: Int = 0
  var imageFile: String = ""
  var subHeading: String = ""
  var heading: String = ""
  
  // MARK: View Controller's Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pageControl.currentPage = index
    contentImageView.image = UIImage(named: imageFile)
    subHeadingLabel.text = subHeading
    headingLabel.text = heading
  }
  
  // MARK: Methods
  
  @IBAction func close(sender: AnyObject) {
    
    // Update for NSUserDefaults
//    let defaults = NSUserDefaults.standardUserDefaults()
//    defaults.setBool(true, forKey: "hasViewedWalkthrough")
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  // NOTE: Need to segue register and sign in buttons
  
  
  
}