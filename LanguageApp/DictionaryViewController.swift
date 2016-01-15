//
//  DictionaryViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/13/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {
    
   
    @IBOutlet weak var TextFieldInput: UITextField!

    @IBOutlet weak var LabelForSavedText: UILabel!
    

    @IBAction func SaveEnglish(sender: UIButton) {
        if (self.TextFieldInput != nil) {
            self.LabelForSavedText.text = self.TextFieldInput.text;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



class DictionaryWordEntry {
    
}