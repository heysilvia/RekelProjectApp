//
//  TableViewController.swift
//  RekelProjectApp
//
//  Created by Silvia Bormüller on 09.07.15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit

class TableViewController: PFQueryTableViewController {
    
    var currentObject : PFObject?
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Items"
        self.textKey = "type"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "Items")
        query.orderByAscending("type")
        return query
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  /*  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let itemType = object?["type"] as? String {
            cell?.textLabel?.text = itemType
        }
        if let itemName = object?["name"] as? String {
            cell?.detailTextLabel?.text = itemName
        }
        
        return cell
    }*/
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ItemCell!
        if cell == nil {
            cell = ItemCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let itemType = object?["item"] as? String {
            cell.itemType.text = itemType
        }
        if let itemName = object?["name"] as? String {
            cell.itemName.text = itemName
        }
        
        // Display flag image
        var initialThumbnail = UIImage(named: "placeholder")
        cell.itemImage.image = initialThumbnail
        if let thumbnail = object?["imageFile"] as? PFFile {
            cell.itemImage.file = thumbnail
            cell.itemImage.loadInBackground()
        }
        
        return cell
    }
    
}
