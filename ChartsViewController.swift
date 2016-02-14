//
//  ChartsViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 2/7/16.
//  Copyright © 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

class ChartsViewController: UIViewController {
    
    var testChartToload: Int = 3

    @IBAction func nounChartButton(sender: AnyObject) {
        self.testChartToload = 0
        customTestFunc()
    }
    
    @IBAction func verbChartButton(sender: AnyObject) {
        self.testChartToload = 1
    }
    
    @IBAction func adjChartButton(sender: AnyObject) {
        self.testChartToload = 2
    }
    
    @IBAction func etcChartButton(sender: AnyObject) {
        self.testChartToload = 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customTestFunc() {
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let chartsTableViewController = segue.destinationViewController as! ChartsTableViewController
            self.testChartToload = chartsTableViewController.testChartToLoad
            chartsTableViewController.reloadInputViews()
        }
    }
}
