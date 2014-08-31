//
//  myTableViewController2.swift
//  Uh oh!
//
//  Created by Benno Ommerborn on 31.08.14.
//  Copyright (c) 2014 Richard Matheson. All rights reserved.
//

import UIKit

class myTableViewController2: UITableViewController {

    @IBOutlet weak var phone1: UITextField!
    @IBOutlet weak var phone2: UITextField!
    @IBOutlet weak var phone3: UITextField!
  
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var name3: UITextField!
    
    var pref:Preferences = Preferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name1.text = pref.friends["name1"]
        name2.text = pref.friends["name2"]
        name3.text = pref.friends["name3"]
        
        phone1.text = pref.friends["phone1"]
        phone2.text = pref.friends["phone2"]
        phone2.text = pref.friends["phone3"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func viewWillDisappear ()
    {
        pref.friends["name1"] = name1.text
        pref.friends["name2"] = name2.text
        pref.friends["name3"] = name3.text
        
        pref.friends["phone1"] = phone1.text
        pref.friends["phone2"] = phone2.text
        pref.friends["phone3"] = phone3.text
        
    }


}
