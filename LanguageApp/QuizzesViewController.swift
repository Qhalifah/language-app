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
        print(quiz)
        self.answerOneText.text = quiz.questionArray[1].objectAnswerOneText
        self.answerTwoText.text = quiz.questionArray[1].objectAnswerTwoText
        self.answerThreeText.text = quiz.questionArray[1].objectAnswerThreeText
        self.answerFourText.text = quiz.questionArray[1].objectAnswerFourText
    }
    
    
    
    
}

class QuizObject: NSObject {
    
    var questionWordsArray: Array<DictionaryWordEntry> = []
    var questionArray: Array<QuizQuestion> = []
    
    var rand: UInt32 = 0
    
    init(dictionaryArry: Array<DictionaryWordEntry>) {
        super.init()
        //shuffle OjibweEnglishDictionary
        
        //change range value here depending on # of questions being asked in each quiz.
        for i in 0...9 {
            rand = arc4random_uniform(UInt32(dictionaryArry.count))
            questionWordsArray.append(dictionaryArry[Int(rand)])
            print("i: \(i)            rand: \(rand)")
        }
        print("SPLIT!")
        
        for dWE in questionWordsArray {
            let individualQuestion = QuizQuestion(i: dWE)
            questionArray.append(individualQuestion)
        }
        print("SPLIT!")
        
        for question in questionArray {
            print("\(question.objectAnswerOneText), \(question.objectAnswerTwoText),  \(question.objectAnswerThreeText),  \(question.objectAnswerFourText): \(question.randomInt + 1)")
            
        }
    }
    
}

class QuizQuestion: NSObject {

    var notQuiteRightErrorArray: [[String]] = [[],["was", "want it to be", "are", "were"]]
    
    var objectQuestionText: String = ""
    var objectAnswerOneText: String = ""
    var objectAnswerTwoText:String = ""
    var objectAnswerThreeText: String = ""
    var objectAnswerFourText: String = ""
    
    var randomInt: UInt32 = 0
  
    //Dict word entry is formatted as dictionaryArray.usableDictionaryArray[index].english||ojibwe||type||subtype
    init(i: DictionaryWordEntry) {
        super.init()
        correctAnswerAssignment(i)
        
    }
    func correctAnswerAssignment(i:DictionaryWordEntry) {
        randomInt = arc4random_uniform(UInt32(3))
        print(randomInt)
        switch randomInt {
        case 0:
            selectDWEntryEnglishText(i)
        case 1:
            selectDWEntryOjibweText(i)
        case 2:
            selectDWEntryTypeText(i)
        default:
            break
        }
    }
    
    func selectDWEntryEnglishText(i: DictionaryWordEntry) {
        randomInt = arc4random_uniform(UInt32(4))
        switch randomInt {
        case 0:
            self.objectAnswerOneText = i.english!
        case 1:
            self.objectAnswerTwoText = i.english!
        case 2:
            self.objectAnswerThreeText = i.english!
        case 3:
            self.objectAnswerFourText = i.english!
        default:
            break
        }
    }
    
    func selectDWEntryOjibweText(i: DictionaryWordEntry) {
        randomInt = arc4random_uniform(UInt32(4))
        switch randomInt {
        case 0:
            self.objectAnswerOneText = i.ojibwe!
        case 1:
            self.objectAnswerTwoText = i.ojibwe!
        case 2:
            self.objectAnswerThreeText = i.ojibwe!
        case 3:
            self.objectAnswerFourText = i.ojibwe!
        default:
            break
        }
    }
    
    func selectDWEntryTypeText(i: DictionaryWordEntry) {
        randomInt = arc4random_uniform(UInt32(4))
        switch randomInt {
        case 0:
            self.objectAnswerOneText = typeQuestionFullText(i.subtype!)
        case 1:
            self.objectAnswerTwoText = typeQuestionFullText(i.subtype!)
        case 2:
            self.objectAnswerThreeText = typeQuestionFullText(i.subtype!)
        case 3:
            self.objectAnswerFourText = typeQuestionFullText(i.subtype!)
        default:
            break
        }
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
    
    
    
    
}




