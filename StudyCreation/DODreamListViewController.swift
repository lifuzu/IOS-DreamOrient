//
//  DODreamListViewController.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/17/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit
import QuartzCore
import CoreData

class DODreamListViewController: UITableViewController, DORuleListViewControllerDelegate, NSFetchedResultsControllerDelegate {

    var dreamItems = Array<DODreamItem>()
    var indexPath: NSIndexPath?
    
    func loadInitialData() {
        var item1 = DODreamItem()
        item1.itemSubject = "SwimWays Submorphers"
        item1.requiredCredits = 10
        item1.currentCredits = 8
        dreamItems.append(item1)
        var item2 = DODreamItem()
        item2.itemSubject = "Auto Transformer"
        item2.requiredCredits = 10
        item2.currentCredits = 2
        dreamItems.append(item2)
        var item3 = DODreamItem()
        item3.itemSubject = "Ticket for Transformer 4"
        item3.requiredCredits = 10
        item3.currentCredits = 0
        dreamItems.append(item3)
    }
    
    func initData(){
        var appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        var newDream = NSEntityDescription.insertNewObjectForEntityForName("Dreams", inManagedObjectContext: context) as NSManagedObject
        newDream.setValue("Spectacular SpiderMan", forKey: "subject")
        newDream.setValue(20, forKey: "requiredCredits")
        
        context.save(nil)
        
        println(newDream)
        println("Object saved.")
    }
    
    func loadData(){
        var appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        var request = NSFetchRequest(entityName: kEntityNameDreamEntity)
        request.returnsObjectsAsFaults = false
        
        var results: NSArray = context.executeFetchRequest(request, error: nil)
        if results.count > 0 {
            for res : AnyObject in results {
                var strSubject = res.valueForKey("subject") as String
                var intCredits = res.valueForKey("requiredCredits") as Int
                self.dreamItems.append(DODreamItem(itemSubject: strSubject, requiredCredits: intCredits))
            }
        }
    }
    
    /*init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadInitialData()
        //self.initData()
        self.loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.dreamItems.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("DreamCell", forIndexPath: indexPath) as UITableViewCell

        let dreamItem = self.dreamItems[indexPath.row]
        cell.textLabel.text = dreamItem.itemSubject
        cell.detailTextLabel.text = "\(dreamItem.currentCredits)/\(dreamItem.requiredCredits)"
        //cell.image = UIImage(named: "HardChoices")

        return cell
    }

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var alert : UIAlertView = UIAlertView()
        alert.title = "Hello"
        alert.message = "Hello World!"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
//    override func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!) {
//        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
//        UIView.animateWithDuration(0.25, animations: {
//            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
//        })
//    }
    
    override func tableView(tableView: UITableView!, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath!) {
        self.indexPath = indexPath
    }
    
    func summarizeCredits(controller: DORuleListViewController, credits: Int) {
        if indexPath {
            let dreamItem = self.dreamItems[indexPath!.row]
            dreamItem.currentCredits = dreamItem.currentCredits + credits
            controller.navigationController.popViewControllerAnimated(true)
            tableView.reloadData()
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

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
        
        if segue.identifier == "listRule" {
            let vc = segue.destinationViewController as DORuleListViewController
            vc.delegate = self
        }
    }
    
    // #pragma mark - Core Data stack
    var managedObjectContext: NSManagedObjectContext {
    get {
        if !_managedObjectContext {
            _managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
        }
        
        return _managedObjectContext!
    }
    }
    var _managedObjectContext: NSManagedObjectContext? = nil
    
    var fetchedResultsController: NSFetchedResultsController {
    get {
        if !_fetchedResultsController {
            // set up fetch request
            var fetchRequest = NSFetchRequest()
            fetchRequest.entity = NSEntityDescription.entityForName(kEntityNameDreamEntity, inManagedObjectContext: (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext)
            
            // sort by last updated
            var sortDescriptor = NSSortDescriptor(key: "requiredCredits", ascending: false)
            fetchRequest.sortDescriptors = [sortDescriptor]
            fetchRequest.fetchBatchSize = 20
            
            _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext, sectionNameKeyPath: nil, cacheName: "allDreamsCache")
            _fetchedResultsController!.delegate = self
        }
        
        return _fetchedResultsController!;
    }
    }
    var _fetchedResultsController: NSFetchedResultsController? = nil

}
