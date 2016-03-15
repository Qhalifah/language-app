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
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var answerOneText: UILabel!
    @IBOutlet weak var answerTwoText: UILabel!
    @IBOutlet weak var answerThreeText: UILabel!
    @IBOutlet weak var answerFourText: UILabel!
    
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let quiz = QuizObject(dictionaryArry: DictionaryArray)
        
        self.questionText.text = "\(quiz.questionArray[1].objectQuestionText) : \(quiz.questionArray[1].correctAnswer)"
        self.answerOneText.text = quiz.questionArray[1].QuizQuestionsOneThroughFour[0]
        self.answerTwoText.text = quiz.questionArray[1].QuizQuestionsOneThroughFour[1]
        self.answerThreeText.text = quiz.questionArray[1].QuizQuestionsOneThroughFour[2]
        self.answerFourText.text = quiz.questionArray[1].QuizQuestionsOneThroughFour[3]
        
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
    }
    
    
    
    
}

class QuizObject: NSObject {
    
    var questionWordsArray: Array<DictionaryWordEntry> = []
    var questionArray: Array<QuizQuestion> = []
    var wrongAnswersDictArray: Array<Array<DictionaryWordEntry>> = []
    
    var rand: UInt32 = 0
    var randWrong: UInt32 = 0
    
    init(dictionaryArry: Array<DictionaryWordEntry>) {
        super.init()
        
        for _ in 0...9 {
            rand = arc4random_uniform(UInt32(dictionaryArry.count))
            var array: Array<DictionaryWordEntry> = []
            
            for _ in 0...2 {
                randWrong = arc4random_uniform(UInt32(dictionaryArry.count))
                while randWrong == rand {
                    randWrong = arc4random_uniform(UInt32(dictionaryArry.count))
                }
                array.append(dictionaryArry[Int(randWrong)])
            }
            
            wrongAnswersDictArray.append(array)
            questionWordsArray.append(dictionaryArry[Int(rand)])
            
        }
        
        var i = 0
        for dWE in questionWordsArray {
            let individualQuestion = QuizQuestion(i: dWE, j: wrongAnswersDictArray[i])
            questionArray.append(individualQuestion)
            i = i + 1
        }
        
    }
    
}

class QuizQuestion: NSObject {
    
    var objectQuestionText: String = ""
    
    var objectAnswerOneText: String = ""
    var objectAnswerTwoText:String = ""
    var objectAnswerThreeText: String = ""
    var objectAnswerFourText: String = ""
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
        self.correctAnswer = Int(randomInt)
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
        self.correctAnswer = Int(randomInt)
        
        
        
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
        randomInt = arc4random_uniform(UInt32(4))
        self.correctAnswer = Int(randomInt)
        
        self.QuizQuestionsOneThroughFour[Int(randomInt)] = typeQuestionFullText(i.subtype!)
        
        if i.type == "noun" {
            self.QuizQuestionsOneThroughFour[0] = typeQuestionFullText("ani")
            self.QuizQuestionsOneThroughFour[1] = typeQuestionFullText("inani")
//            case "ani":
//                if self.QuizQuestionsOneThroughFour[0] == " " {
//                    self.QuizQuestionsOneThroughFour[0] = typeQuestionFullText("inani")
//                    self.QuizQuestionsOneThroughFour[1] = typeQuestionFullText("ani")
//                }
//                else if self.QuizQuestionsOneThroughFour[0] == "ani" {
//                    self.QuizQuestionsOneThroughFour[1] = typeQuestionFullText("inani")
//                }
//                else if self.QuizQuestionsOneThroughFour[1] == "ani" {
//                    self.QuizQuestionsOneThroughFour[0] = typeQuestionFullText("inani")
//                }
//                else if self.QuizQuestionsOneThroughFour[1] == " " {
//                    self.QuizQuestionsOneThroughFour[0] = typeQuestionFullText("inani")
//                }
//                
//            case "inani":
//                for k in 0...QuizQuestionsOneThroughFour.count - 1 {
//                    if self.QuizQuestionsOneThroughFour[k] == " " {
//                        self.QuizQuestionsOneThroughFour[k] = typeQuestionFullText("ani")
//                    }
//                }
                
            self.correctAnswer = correctAnswerIntReturn(i)
            
        }
        else if i.type == "verb" {
//            switch i.subtype! {
//            case "ii":
//                for k in 0...QuizQuestionsOneThroughFour.count - 1 {
//                    if self.QuizQuestionsOneThroughFour[k] == " " {
//                        self.QuizQuestionsOneThroughFour[k] = typeQuestionFullText(verbSubtypes[checkVerbTypeEquallcy("ii")])
//                    }
//                }
//            case "ai":
//                for k in 0...QuizQuestionsOneThroughFour.count - 1 {
//                    if self.QuizQuestionsOneThroughFour[k] == " " {
//                        self.QuizQuestionsOneThroughFour[k] = typeQuestionFullText(verbSubtypes[checkVerbTypeEquallcy("ai")])
//                    }
//                }
//            case "ta":
//                for k in 0...QuizQuestionsOneThroughFour.count - 1 {
//                    if self.QuizQuestionsOneThroughFour[k] == " " {
//                        self.QuizQuestionsOneThroughFour[k] = typeQuestionFullText(verbSubtypes[checkVerbTypeEquallcy("ti")])
//                    }
//                }
//            case "ti":
//                for k in 0...QuizQuestionsOneThroughFour.count - 1 {
//                    if self.QuizQuestionsOneThroughFour[k] == " " {
//                        self.QuizQuestionsOneThroughFour[k] = typeQuestionFullText(verbSubtypes[checkVerbTypeEquallcy("ta")])
//                    }
//                }
//            default: break
//            }
            
            self.QuizQuestionsOneThroughFour[0] = typeQuestionFullText("ii")
            self.QuizQuestionsOneThroughFour[1] = typeQuestionFullText("ai")
            self.QuizQuestionsOneThroughFour[2] = typeQuestionFullText("ti")
            self.QuizQuestionsOneThroughFour[3] = typeQuestionFullText("ta")
            
            self.correctAnswer = correctAnswerIntReturn(i)
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
    
    
    func checkVerbTypeEquallcy(i: String) -> Int {
        self.randomInt = arc4random_uniform(UInt32(4))
        while verbSubtypes[Int(randomInt)] == i {
            self.randomInt = arc4random_uniform(UInt32(4))
        }
        return Int(self.randomInt)
    }
    
    func correctAnswerIntReturn(i: DictionaryWordEntry) -> Int {
        var int = 0
        switch i.subtype! {
        case "ani":
            int = 1
        case "inani":
            int = 2
        case "ii":
            int = 1
        case "ai":
            int = 2
        case "ti":
            int = 3
        case "ta":
            int = 4
        default:
            break
        }
        return int
    }
    
}




