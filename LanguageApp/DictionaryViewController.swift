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
    @IBOutlet weak var wordToFind: UITextField!
    @IBOutlet weak var englishSearchButtonButton: UIButton!
    

    @IBAction func SaveEnglish(sender: UIButton) {
        if (self.TextFieldInput != nil) {
            self.LabelForSavedText.text = self.TextFieldInput.text;
        }
    }
    var testDictionaryArray: Array<DictionaryWordEntry> = []
    
    @IBAction func englishSearchButton(sender: AnyObject) {
        self.englishSearchButtonButton.setTitle("HI", forState: .Normal)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var newTestDictionaryObject = OjibweEnglishDictionary();
        testDictionaryArray = newTestDictionaryObject.usableDictionaryArray;
        
//        var yetAnotherArray: Array<AnyObject> = []
//        for i in testDictionaryArray {
//            yetAnotherArray.append(i)
//        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func findDictionaryWordEntry(wordToFind:String, oOrE:String) {
        
        for i in testDictionaryArray {
            switch oOrE {
            case "english":
                self.LabelForSavedText.text = "Switch logged English"
            case "ojibwe":
                self.LabelForSavedText.text = "Switch logged Ojibwe"
            default:
                self.LabelForSavedText.text = "Switch logged default"
            }
        }
        
    }
    
    
}


