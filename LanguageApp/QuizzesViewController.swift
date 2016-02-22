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
        
        for dWE in questionWordsArray {
            let individualQuestion = QuizQuestion(i: dWE)
            questionArray.append(individualQuestion)
        }
    }
    
}

class QuizQuestion: NSObject {

    var notQuiteRightErrorArray: [[String]] = [[],["was", "want it to be", "are", "were"]]
    
    var objectQuestionText: String = ""
    //NEED either another class to be a QuizObject, or an array of answer values for each of the needed answers.
    var objectAnswerOneText: String = ""
    var objectAnswerTwoText:String = ""
    var objectAnswerThreeText: String = ""
    var objectAnswerFourText: String = ""
    
    var randomIntForQuestionAssignment: UInt32 = 0
    var randomIntForTypeOfQuestionAssignment: UInt32 = 0
  
    //Dict word entry is formatted as dictionaryArray.usableDictionaryArray[index].english||ojibwe||type||subtype
    init(i: DictionaryWordEntry) {
        super.init()
        //shuffle OjibweEnglishDictionary
        self.randomIntForQuestionAssignment = 1
        self.randomIntForTypeOfQuestionAssignment = 1
        
        correctAnswerAssignment(i)
        
    }
    func correctAnswerAssignment(i:DictionaryWordEntry) {
        randomIntForTypeOfQuestionAssignment = arc4random_uniform(UInt32(4))
        print(randomIntForTypeOfQuestionAssignment)
        switch randomIntForTypeOfQuestionAssignment {
        case 0:
            selectDWEntryEnglishText(i)
        case 1:
            selectDWEntryOjibweText(i)
        case 2 | 3:
            selectDWEntryTypeText(i)
        default:
            break
        }
    }
    
    func selectDWEntryEnglishText(i: DictionaryWordEntry) {
        randomIntForQuestionAssignment = arc4random_uniform(UInt32(4))
        switch randomIntForQuestionAssignment {
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
        randomIntForQuestionAssignment = arc4random_uniform(UInt32(4))
        switch randomIntForQuestionAssignment {
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
        randomIntForQuestionAssignment = arc4random_uniform(UInt32(4))
        switch randomIntForQuestionAssignment {
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
        print(text)
        return text
    }
    
    
    
    
}

/* Extension for Array from (*website is bookmarked*), used to shuffle Array. Gave error ~'type () does not conform to Protocol SequenceType'
extension Array {
    mutating func shuffle() {
        for i in  0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - 1))) + i
            swap(&self[i], &self[j])
        }
    }
}*/
