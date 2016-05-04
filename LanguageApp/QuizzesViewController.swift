//
//  QuizzesViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/15/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//
//

import UIKit

class QuizzesViewController: UIViewController {
    
    var DictionaryArray: Array<DictionaryWordEntry> = []
    var classQuiz: QuizObject = QuizObject(dictionaryArry: nil, numberQuestions: 10)
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var answerOneText: UILabel!
    @IBOutlet weak var answerTwoText: UILabel!
    @IBOutlet weak var answerThreeText: UILabel!
    @IBOutlet weak var answerFourText: UILabel!
    
    @IBOutlet weak var questionLabelOne: UILabel!
    @IBOutlet weak var questionLabelTwo: UILabel!
    @IBOutlet weak var questionLabelThree: UILabel!
    @IBOutlet weak var questionLabelFour: UILabel!
    
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    @IBOutlet weak var totalQuestionsCompletedNumber: UILabel!
    @IBOutlet weak var totalQuestionsCorrect: UILabel!
    var totalQuestionsCorrectCount = 0
    var questionUserIsOnCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answerOneButton.layer.cornerRadius = 1
        self.answerOneButton.layer.borderWidth = 2
        self.answerOneButton.layer.borderColor = UIColor.blackColor().CGColor
        
        self.answerTwoButton.layer.cornerRadius = 1
        self.answerTwoButton.layer.borderWidth = 2
        self.answerTwoButton.layer.borderColor = UIColor.blackColor().CGColor
        
        self.answerThreeButton.layer.cornerRadius = 1
        self.answerThreeButton.layer.borderWidth = 2
        self.answerThreeButton.layer.borderColor = UIColor.blackColor().CGColor
        
        self.answerFourButton.layer.cornerRadius = 1
        self.answerFourButton.layer.borderWidth = 2
        self.answerFourButton.layer.borderColor = UIColor.blackColor().CGColor
        
        self.totalQuestionsCompletedNumber.text = String(questionUserIsOnCount + 1)
        self.totalQuestionsCorrect.text = String(totalQuestionsCorrectCount)
        questionActionFunction()
        
    }
    
    @IBAction func answerOneFunction(sender: AnyObject) {
        
        answerCheckFunction(correctAnswerNumber(), buttonNumber: 1)
    }
    
    @IBAction func answerTwoFunction(sender: AnyObject) {
        answerCheckFunction(correctAnswerNumber(), buttonNumber: 2)
    }

    @IBAction func answerThreeFunction(sender: AnyObject) {
        answerCheckFunction(correctAnswerNumber(), buttonNumber: 3)
    }
    
    @IBAction func answerFourFunction(sender: AnyObject) {
        answerCheckFunction(correctAnswerNumber(), buttonNumber: 4)
    }
    
    
    @IBAction func nextQuestionButtonAction(sender: AnyObject) {
        if (questionUserIsOnCount + 1) < classQuiz.totalQuizQuestionsNumber {
            self.questionUserIsOnCount += 1
            self.totalQuestionsCompletedNumber.text = String(questionUserIsOnCount + 1)
            questionActionFunction()
        }
    }
    
    func questionActionFunction() {
        
        self.questionText.text = classQuiz.questionArray[questionUserIsOnCount].objectQuestionText
        self.answerOneText.text = classQuiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[0]
        self.answerTwoText.text = classQuiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[1]
        self.answerThreeText.text = classQuiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[2]
        self.answerFourText.text = classQuiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[3]
        
        if classQuiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[0] == "Animate" || classQuiz.questionArray[1].QuizQuestionsOneThroughFour[0] == "Inanimate" {
            self.answerThreeButton.alpha = 0.0
            self.answerThreeText.alpha = 0.0
            self.questionLabelThree.alpha = 0.0
            
            self.answerFourButton.alpha = 0.0
            self.answerFourText.alpha = 0.0
            self.questionLabelFour.alpha = 0.0

        }
        else {
            self.answerThreeButton.alpha = 1.0
            self.answerThreeText.alpha = 1.0
            self.questionLabelThree.alpha = 1.0
            
            self.answerFourButton.alpha = 1.0
            self.answerFourText.alpha = 1.0
            self.questionLabelFour.alpha = 1.0
        }
        
        self.answerOneButton.layer.borderColor = UIColor.blackColor().CGColor
        self.answerTwoButton.layer.borderColor = UIColor.blackColor().CGColor
        self.answerThreeButton.layer.borderColor = UIColor.blackColor().CGColor
        self.answerFourButton.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func answerCheckFunction(correctAnswer: Int, buttonNumber: Int) {
        
        UIView.animateWithDuration(2, animations: {
            self.answerOneButton.layer.borderColor = UIColor.redColor().CGColor
            self.answerTwoButton.layer.borderColor = UIColor.redColor().CGColor
            self.answerThreeButton.layer.borderColor = UIColor.redColor().CGColor
            self.answerFourButton.layer.borderColor = UIColor.redColor().CGColor
            
            switch correctAnswer {
            case 1:
                self.answerOneButton.layer.borderColor = UIColor.greenColor().CGColor
            case 2:
                self.answerTwoButton.layer.borderColor = UIColor.greenColor().CGColor
            case 3:
                self.answerThreeButton.layer.borderColor = UIColor.greenColor().CGColor
            case 4:
                self.answerFourButton.layer.borderColor = UIColor.greenColor().CGColor
            default: break
            }
            
            if buttonNumber == correctAnswer {
                self.addCorrectQuestionCount()
            }
    
        })
    }
    
    func addCorrectQuestionCount() {
        self.totalQuestionsCorrectCount += 1
        self.totalQuestionsCorrect.text = String(self.totalQuestionsCorrectCount)
    }
    
    func correctAnswerNumber () -> Int {
        return (classQuiz.questionArray[questionUserIsOnCount].correctAnswer)
    }
    
    
    
}






