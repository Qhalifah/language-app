//
//  QuizzesStartPageViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 5/3/16.
//  Copyright © 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

class QuizzesStartPageViewController: UIViewController {
    
    var passingQuiz: QuizObject = QuizObject(dictionaryArry: nil, numberQuestions: 10)
    var numberQuizQuestions = 10

    @IBOutlet weak var quizQuestionNumberLabel: UILabel!
    

    @IBAction func quizQuestionNumberIncreaseButton(sender: AnyObject) {
        let numberStringValue = Int(self.quizQuestionNumberLabel.text!)
        if  numberStringValue != nil {
            if numberStringValue > 40 { }
            else {
                let newValue = numberStringValue! + 10
                self.quizQuestionNumberLabel.text = String(newValue)
                self.numberQuizQuestions = newValue
            }
        }
        
    }
    
    @IBAction func quizQuestionNumberDecreaseButton(sender: AnyObject) {
        let numberStringValue = Int(self.quizQuestionNumberLabel.text!)
        if numberStringValue != nil {
            if numberStringValue < 20 {}
            else {
                let newValue = numberStringValue! - 10
                self.quizQuestionNumberLabel.text = String(newValue)
                self.numberQuizQuestions = newValue
            }
        }
    }

    
    var DictionaryArray: Array<DictionaryWordEntry> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.quizQuestionNumberLabel.text = "10"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let quiz = QuizObject(dictionaryArry: DictionaryArray, numberQuestions: self.numberQuizQuestions)
        self.passingQuiz = quiz
        
        let nextViewController = segue.destinationViewController as! QuizzesViewController
        nextViewController.classQuiz = self.passingQuiz

    }


}











