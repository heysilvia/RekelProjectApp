//
//  PageViewController.swift
//  RekelProjectApp
//
//  Created by Chris Kong on 7/12/15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource
{
  var pageImages = ["Page Content Image Icon 1", "Page Content Image Icon 2", "Page Content Image Icon 3"]
  var pageSubHeadings = ["*sigh*", "", ""]
  var pageHeadings = ["THEY GROW UP SO FAST DON'T THEY", "TIME TO SELL THE OLD AND BUY SOME NEW", "REKEL IS A BOUTIQUE MARKETPLACE"]
  
  // MARK: View Controller's Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the data source to itself
    dataSource = self
    
    // Create the first walkthrough screen
    if let startingViewController = self.viewControllerAtIndex(0) {
      setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
    }
  }
  
  // MARK: Methods
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    
    var index = (viewController as! PageContentViewController).index
    index++
    return self.viewControllerAtIndex(index)
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    
    var index = (viewController as! PageContentViewController).index
    index--
    return self.viewControllerAtIndex(index)
  }
  
  func viewControllerAtIndex(index: Int) -> PageContentViewController? {
    
    if index == NSNotFound || index < 0 || index >= self.pageHeadings.count {
      return nil
    }
    
    // Create a new view controller and pass suitable data.
    if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as? PageContentViewController {
      
      pageContentViewController.imageFile = pageImages[index]
      pageContentViewController.subHeading = pageSubHeadings[index]
      pageContentViewController.heading = pageHeadings[index]
      pageContentViewController.index = index
      
      return pageContentViewController
    }
    return nil
  }

//  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//    return pageHeadings.count
//  }
//  
//  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//    if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as? PageContentViewController {
//      return pageContentViewController.index
//    }
//    return 0
//  }
  
}