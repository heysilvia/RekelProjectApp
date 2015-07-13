//
//  ItemsTableViewController.swift
//  RekelProjectApp
//
//  Created by Silvia Bormüller on 13.07.15.
//  Copyright (c) 2015 rekel. All rights reserved.
//

import UIKit

class ItemsTableViewController: PFQueryTableViewController {
   
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
    override func queryForTable() -> PFQuery{
        var query = PFQuery(className: "Items")
        query.orderByAscending("type")
        return query
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell!
        if cell == nil {
            cell = CustomCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CustomCell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let itemName = object?["name"] as? String {
            cell.customName.text = itemName
        }
       
        // Display flag image
        var initialThumbnail = UIImage(named: "placeholder")
        cell.customImage.image = initialThumbnail
        if let thumbnail = object?["imageFile"] as? PFFile {
            cell.customImage.file = thumbnail
            cell.customImage.loadInBackground()
        }
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var showDetailView = segue.destinationViewController as! DetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            showDetailView.currentObject = (objects?[row] as! PFObject)
        }
    }
}