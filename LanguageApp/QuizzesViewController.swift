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
    var classSizeQuiz: QuizObject = QuizObject(dictionaryArry: nil)
    var questionUserIsOnCount: Int = 0
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var answerOneText: UILabel!
    @IBOutlet weak var answerTwoText: UILabel!
    @IBOutlet weak var answerThreeText: UILabel!
    @IBOutlet weak var answerFourText: UILabel!
    
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nextQuestionButtonActionFunction()
        
    }
    
    @IBAction func answerOneFunction(sender: AnyObject) {
        
        answerCheckFunction(correctAnswerNumber())
    }
    
    @IBAction func answerTwoFunction(sender: AnyObject) {
        answerCheckFunction(correctAnswerNumber())
    }

    @IBAction func answerThreeFunction(sender: AnyObject) {
        answerCheckFunction(correctAnswerNumber())
    }
    
    @IBAction func answerFourFunction(sender: AnyObject) {
        answerCheckFunction(correctAnswerNumber())
    }
    
    
    @IBAction func nextQuestionButtonAction(sender: AnyObject) {
        while (questionUserIsOnCount <= 9) {
            self.questionUserIsOnCount += 1
            nextQuestionButtonActionFunction()
        }
    }
    
    func nextQuestionButtonActionFunction() {
        let quiz = QuizObject(dictionaryArry: DictionaryArray)
        self.classSizeQuiz = quiz
        
        self.questionText.text = quiz.questionArray[questionUserIsOnCount].objectQuestionText
        self.answerOneText.text = quiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[0]
        self.answerTwoText.text = quiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[1]
        self.answerThreeText.text = quiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[2]
        self.answerFourText.text = quiz.questionArray[questionUserIsOnCount].QuizQuestionsOneThroughFour[3]
        
        if quiz.questionArray[1].QuizQuestionsOneThroughFour[0] == "Animate" {
            self.answerThreeButton.alpha = 0.0
            self.answerFourButton.alpha = 0.0
            self.answerFourText.alpha = 0.0
            self.answerThreeText.alpha = 0.0
        }
        else if quiz.questionArray[1].QuizQuestionsOneThroughFour[0] == "Inanimate" {
            self.answerThreeButton.alpha = 0.0
            self.answerFourButton.alpha = 0.0
            self.answerThreeText.alpha = 0.0
            self.answerFourText.alpha = 0.0
        }
        else {
            self.answerThreeButton.alpha = 1.0
            self.answerFourButton.alpha = 1.0
            self.answerThreeText.alpha = 1.0
            self.answerFourText.alpha = 1.0
        }
    }
    
    func answerCheckFunction(buttonNumber: Int) {
        
        UIView.animateWithDuration(2, animations: {
            self.answerOneButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            self.answerTwoButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            self.answerThreeButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            self.answerFourButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            
            switch buttonNumber {
            case 1:
                self.answerOneButton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                self.answerOneButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            case 2:
                self.answerTwoButton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                self.answerTwoButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            case 3:
                self.answerThreeButton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                self.answerThreeButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            case 4:
                self.answerFourButton.transform = CGAffineTransformMakeScale(1.5, 1.5)
                self.answerFourButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
            default: break
            }
    
        })
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse, animations: {
            switch buttonNumber {
            case 1:
                self.answerOneButton.transform = CGAffineTransformMakeScale(1.25, 1.25)
            case 2:
                self.answerTwoButton.transform = CGAffineTransformMakeScale(1.25, 1.25)
            case 3:
                self.answerThreeButton.transform = CGAffineTransformMakeScale(1.25, 1.25)
            case 4:
                self.answerFourButton.transform = CGAffineTransformMakeScale(1.25, 1.25)
            default: break }
            }, completion:  {
                (value: Bool) in
                if self.answerOneButton.currentTitleColor == UIColor.greenColor() ||
                    self.answerOneButton.currentTitleColor == UIColor.redColor() {}
                
        })
    }
    
    func correctAnswerNumber () -> Int {
        return (classSizeQuiz.questionArray[1].correctAnswer)
    }
    
    
    
}

class QuizObject: NSObject {
    
    var questionWordsArray: Array<DictionaryWordEntry> = []
    var questionArray: Array<QuizQuestion> = []
    var wrongAnswersDictArray: Array<Array<DictionaryWordEntry>> = []
    
    var rand: UInt32 = 0
    var randWrong: UInt32 = 0
    
    init(dictionaryArry: Array<DictionaryWordEntry>?) {
        super.init()
        if dictionaryArry == nil {
            print("Recived nil from dictionaryArray in QuizObject")
        }
        else {
            for _ in 0...9 {
            
                rand = arc4random_uniform(UInt32(dictionaryArry!.count))
                var array: Array<DictionaryWordEntry> = []
            
                for _ in 0...2 {
                    randWrong = arc4random_uniform(UInt32(dictionaryArry!.count))
                    while randWrong == rand {
                        randWrong = arc4random_uniform(UInt32(dictionaryArry!.count))
                    }
                    array.append(dictionaryArry![Int(randWrong)])
                }
            
                wrongAnswersDictArray.append(array)
                questionWordsArray.append(dictionaryArry![Int(rand)])
            }
            
            var i = 0
            for dWE in questionWordsArray {
                let individualQuestion = QuizQuestion(i: dWE, j: wrongAnswersDictArray[i])
                questionArray.append(individualQuestion)
                i = i + 1
            }
        }
        
    }
    
}

class QuizQuestion: NSObject {
    
    var objectQuestionText: String = ""
    var correctAnswer: Int = 0
    var QuizQuestionsOneThroughFour: [String] = [" ", " ", " ", " "]
    
    var randomInt: UInt32 = 0
    var otherRandomInt: UInt32 = 0
    let verbSubtypes: [String] = ["ii", "ai", "ti", "ta"]
  
    //Dict word entry is formatted as dictionaryArray.usableDictionaryArray[index].english||ojibwe||type||subtype
    init(i: DictionaryWordEntry, j: Array<DictionaryWordEntry>) {
        super.init()
        questionAssignment(i,j: j)
        
    }
    func questionAssignment(i:DictionaryWordEntry, j:Array<DictionaryWordEntry>) {
        randomInt = arc4random_uniform(UInt32(3))
        switch randomInt {
        case 0:
            selectDWEntryEnglishText(i, j: j)
        case 1:
            selectDWEntryOjibweText(i, j: j)
        case 2:
            selectDWEntryTypeText(i)
        default:
            break
        }
    }
    
    func selectDWEntryEnglishText(i: DictionaryWordEntry, j: Array<DictionaryWordEntry>) {
        randomInt = arc4random_uniform(UInt32(4))
        print("\(randomInt) : English")
        self.correctAnswer = (Int(randomInt) + 1)
        self.QuizQuestionsOneThroughFour[Int(randomInt)] = i.english!

        var count = 0
        for i in 0...(QuizQuestionsOneThroughFour.count - 1) {
            if self.QuizQuestionsOneThroughFour[i] == " " {
                self.QuizQuestionsOneThroughFour[i] = j[count].english!
                count += 1
            }
        }
        
        self.objectQuestionText = "What is \(i.ojibwe!) in english?"
        
    }
    
    func selectDWEntryOjibweText(i: DictionaryWordEntry, j: Array<DictionaryWordEntry>) {
        randomInt = arc4random_uniform(UInt32(4))
        print("\(randomInt) : Ojibwe")
        self.correctAnswer = (Int(randomInt) + 1)
        
        
        
        self.QuizQuestionsOneThroughFour[Int(randomInt)] = i.ojibwe!
        
        var count = 0
        for k in 0...QuizQuestionsOneThroughFour.count - 1 {
            if self.QuizQuestionsOneThroughFour[k] == " " {
                self.QuizQuestionsOneThroughFour[k] = j[count].ojibwe!
                count += 1
            }
        }
        
        self.objectQuestionText = "What is \(i.english!) in Ojibwe?"
    }
    
    func selectDWEntryTypeText(i: DictionaryWordEntry) {
        
        if i.type == "noun" {
            self.QuizQuestionsOneThroughFour[0] = typeQuestionFullText("ani")
            self.QuizQuestionsOneThroughFour[1] = typeQuestionFullText("inani")
                
            self.correctAnswer = correctAnswerIntReturn(i)
            print("\(correctAnswerIntReturn(i)) : Type")
            
        }
        else if i.type == "verb" {
            
            self.QuizQuestionsOneThroughFour[0] = typeQuestionFullText("ii")
            self.QuizQuestionsOneThroughFour[1] = typeQuestionFullText("ai")
            self.QuizQuestionsOneThroughFour[2] = typeQuestionFullText("ti")
            self.QuizQuestionsOneThroughFour[3] = typeQuestionFullText("ta")
            
            self.correctAnswer = correctAnswerIntReturn(i)
            print("\(correctAnswerIntReturn(i)) : Type")
            
        }
        
        self.objectQuestionText = "What type of \((i.type)!.capitalizedString) is \(i.ojibwe!)?"
    }
    
    func typeQuestionFullText(typeText: String) -> String {
        var text: String = ""
        switch typeText {
        case "ii":
            text = "Intransitive Inanimate"
        case "ai":
            text = "Intransitive Animate"
        case "ti":
            text = "Transitive Inanimate"
        case "ta":
            text = "Transitive Animate"
        case "ani":
            text = "Animate"
        case "inani":
            text = "Inanimate"
        default:
            break
        }
        return text
    }
    
    func correctAnswerIntReturn(i: DictionaryWordEntry) -> Int {
        switch i.subtype! {
        case "ani":
            return 1
        case "inani":
            return 2
        case "ii":
            return 1
        case "ai":
            return 2
        case "ti":
            return 3
        case "ta":
            return 4
        default:
            return 5
        }
        //return (int)
    }
    
}




