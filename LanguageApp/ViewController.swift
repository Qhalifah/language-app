//
//  ViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/13/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goToDictionary: UIButton!
    @IBOutlet weak var goToConjugation: UIButton!
    @IBOutlet weak var goToQuizzes: UIButton!
    @IBOutlet weak var chartBarButton: UIBarButtonItem!
    
    
    var testDictionaryArray: Array<DictionaryWordEntry> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newTestDictionaryObject = OjibweEnglishDictionary();
        testDictionaryArray = newTestDictionaryObject.usableDictionaryArray;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch sender as! UIButton {
        case goToDictionary:
            let nextViewController: DictionaryViewController = segue.destinationViewController as! DictionaryViewController
            nextViewController.DictionaryArray = self.testDictionaryArray
        case goToConjugation:
            let nextViewController: ConjugationViewController = segue.destinationViewController as! ConjugationViewController
            nextViewController.DictionaryArray = self.testDictionaryArray
        case goToQuizzes:
            let nextViewController: QuizzesViewController = segue.destinationViewController as! QuizzesViewController
            nextViewController.DictionaryArray = self.testDictionaryArray
        default:
            break
            
        }
    }
  
}

