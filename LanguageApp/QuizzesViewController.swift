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
        let quizQuestion = QuizQuestion(dictionaryArry: DictionaryArray)
        print(quizQuestion)
    }
    
    
    
    
}

class QuizQuestion: NSObject {

    var questionWordsArray: Array<DictionaryWordEntry> = []
    var notQuiteRightErrorArray: [[String]] = [[],["was", "want it to be", "are", "were"]]
    
    var objectQuestionText: String = ""
    var objectAnswerOneText: String = ""
    var objectAnswerTwoText:String = ""
    var objectAnswerThreeText: String = ""
    var objectAnswerFourText: String = ""
    
    var randomIntForQuestionAssignment: UInt32 = 0
    var randomIntForTypeOfQuestionAssignment: UInt32 = 0
    var rand: UInt32 = 0
  
    //Dict word entry is formatted as dictionaryArray.usableDictionaryArray[index].english||ojibwe||type||subtype
    init(dictionaryArry: Array<DictionaryWordEntry>) {
        //shuffle OjibweEnglishDictionary
        self.randomIntForQuestionAssignment = 1
        self.randomIntForTypeOfQuestionAssignment = 1
        let testArray: Array<DictionaryWordEntry> = dictionaryArry.self
        
        for i in 0...9 {
            rand = arc4random_uniform(UInt32(testArray.count))
            questionWordsArray.append(testArray[Int(rand)])
            print("i: \(i)            rand: \(rand)")
        }
        
        //Have a randomized array of changes to make to the word/entry/etc., assign the actual answer
        //to a random value of 1-4, and assign the another meaning (either wrong verb person/tense) or wrong noun.
    }
    
    func selectDWEntryEnglishText(i: DictionaryWordEntry) {
        switch randomIntForQuestionAssignment {
        case 1:
            self.objectAnswerOneText = i.english!
        case 2:
            self.objectAnswerTwoText = i.english!
        case 3:
            self.objectAnswerThreeText = i.english!
        case 4:
            self.objectAnswerFourText = i.english!
        default:
            break
        }
    }
    
    func selectDWEntryOjibweText(i: DictionaryWordEntry) {
        switch randomIntForQuestionAssignment {
        case 1:
            self.objectAnswerOneText = i.ojibwe!
        case 2:
            self.objectAnswerTwoText = i.ojibwe!
        case 3:
            self.objectAnswerThreeText = i.ojibwe!
        case 4:
            self.objectAnswerFourText = i.ojibwe!
        default:
            break
        }
    }
    
    func selectDWEntryTypeText(i: DictionaryWordEntry) {
        switch randomIntForTypeOfQuestionAssignment {
        case 1:
            self.objectAnswerOneText = typeQuestionFullText(i.subtype!)
        case 2:
            self.objectAnswerTwoText = typeQuestionFullText(i.subtype!)
        case 3:
            self.objectAnswerThreeText = typeQuestionFullText(i.subtype!)
        case 4:
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

/* Extension for Array from (*website is bookmarked*), used to shuffle Array. Gave error ~'type () does not conform to Protocol SequenceType'
extension Array {
    mutating func shuffle() {
        for i in  0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - 1))) + i
            swap(&self[i], &self[j])
        }
    }
}*/
