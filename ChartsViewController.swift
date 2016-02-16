//
//  ChartsViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 2/7/16.
//  Copyright © 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

protocol globalProtocol {
    
    var testChartToLoad: Int { get }
    
}

class ChartsViewController: UIViewController, globalProtocol {
    
    var testChartToLoad: Int = 1

    @IBAction func nounChartButton(sender: AnyObject) {
        self.testChartToLoad = 0
    }
    
    @IBAction func verbChartButton(sender: AnyObject) {
        self.testChartToLoad = 1
    }
    
    @IBAction func adjChartButton(sender: AnyObject) {
        self.testChartToLoad = 2
    }
    
    @IBAction func etcChartButton(sender: AnyObject) {
        self.testChartToLoad = 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Not going to be activated by the click of a button...
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let chartsTableViewController = segue.destinationViewController as! ChartsTableViewController
        self.testChartToLoad = chartsTableViewController.testChartToLoad
        chartsTableViewController.reloadInputViews()
    }*/
}

class ChartsTableViewController: UITableViewController, globalProtocol  {
    
    var testChartToLoad: Int = 3
    
    var chartsForTest: [[String]] = [["Beshig", "Niiwin", "Niswi", "Niiwin"], ["Naanan"], ["Six"], ["Seven"]]
    var chartToBeUsed: [String] = []
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        //Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.chartToBeUsed = self.chartsForTest[testChartToLoad]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.chartToBeUsed.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        print(self.chartToBeUsed[indexPath.row])
        cell.textLabel?.text = self.chartToBeUsed[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView()
            let nounChartButton = UIButton(type: UIButtonType.System) as UIButton
            nounChartButton.frame = CGRectMake(100, 100, 100, 50)
            nounChartButton.backgroundColor = UIColor.whiteColor()
            nounChartButton.setTitle("Nouns", forState: UIControlState.Normal)
            nounChartButton.addTarget(self, action: "nounChartButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        
            self.view.addSubview(nounChartButton)
            return view
        }
        return nil
    }
    
    /*
    func nounChartButtonaction(sender: UIButton!) {
        self.testChartToLoad = 1
        self.tableView.reloadData()//
    }*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
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
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
