//
//  DORuleListViewController.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/17/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

protocol DORuleListViewControllerDelegate {
    func summarizeCredits(controller: DORuleListViewController, credits: Int)
}

@objc(DORuleListViewController) class DORuleListViewController: UITableViewController {

    var delegate: DORuleListViewControllerDelegate? = nil
    var ruleItems = Array<DORuleItem>()
    var credits: Int = 0
    
    func loadInitialData() {
        var item1 = DORuleItem()
        item1.itemName = "Clean Room"
        ruleItems.append(item1)
        var item2 = DORuleItem()
        item2.itemName = "Good Sleep Self"
        ruleItems.append(item2)
        var item3 = DORuleItem()
        item3.itemName = "No Wetting The Bed"
        ruleItems.append(item3)
    }
    
    /*init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadInitialData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveCredits(sender: UIBarButtonItem) {
        if delegate {
            delegate!.summarizeCredits(self, credits: credits)
        }
    }
    
    @IBAction func unwindToRuleList(segue: UIStoryboardSegue!) {
        var source : DORuleItemViewController = segue.sourceViewController as DORuleItemViewController
        var item : DORuleItem = source.ruleItem
        
        if (!item.itemName.isEmpty) {
            self.ruleItems.append(item)
            self.tableView.reloadData()
        }
    }

    @IBAction func stepperValueDidChanged(sender : UIStepper) {
        var cell = sender.superview.superview.superview
        self.credits += Int(sender.value)
    }
    
    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.ruleItems.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:ThumbUpDownTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as ThumbUpDownTableViewCell!
        if (cell == nil) {
            cell = ThumbUpDownTableViewCell(style:.Default, reuseIdentifier: "Cell")
        }
        let ruleItem = self.ruleItems[indexPath.row]
        cell.textDisplay.text = ruleItem.itemName
        
        return cell
    }

    
    
    // Override to support conditional editing of the table view.
    /*override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }*/

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier? == "editRule" {
            let index = tableView.indexPathForSelectedRow()
            var ruleItem = ruleItems[index.row]
            let vc = segue.destinationViewController as DORuleItemViewController
            vc.ruleName = ruleItem.itemName
        } else if segue.identifier? == "listRule" {
            println("Hello")
        }
    }

}
