//
//  DictionaryViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/13/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var LabelEnglish: UILabel!
    @IBOutlet weak var LabelOjibwe: UILabel!

    @IBOutlet weak var OjibweTextFieldInput: UITextField!
    @IBAction func EnglishTextFieldInputFcn(sender: UITextField) {
        
    }
    
    
    @IBAction func SaveOjibwe(sender: UIButton) {
        if (self.OjibweTextFieldInput != nil) {
            self.LabelOjibwe.text = self.OjibweTextFieldInput.text;
        }
    }
    

    @IBAction func SaveEnglish(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("Hello");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}