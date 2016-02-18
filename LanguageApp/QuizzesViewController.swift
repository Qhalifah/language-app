//
//  QuizzesViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/15/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//
//60min
//
//God I still want to be in a relationship with her - I want to hold her be close to her and be held by her and kiss her and cuddle with her and just sit and do work with her. I'm scared that what exists with us is going to break, or change in a way that doesn't have the same kind of calm and comfort and love and good of it. Please ack I'm scared, and nervous, and sad.

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
    }
    
    
    
    
}

class QuizQuestion: NSObject {

    var questionWordsArray: Array<DictionaryWordEntry> = []
    var objectQuestionText: String = ""
    var objectAnswerOneText: String = ""
    var objectAnswerTwoText:String = ""
    var objectAnswerThreeText: String = ""
    var objectAnswerFourText: String = ""
    var randomIntForQuestionAssignment: Int
    var randomIntForTypeOfQuestionAssignment: Int
    var notQuiteRightErrorArray: [[String]] = [[],["was", "want it to be", "are", "were"]]
  
    //Dict word entry is formatted as dictionaryArray.usableDictionaryArray[index].english||ojibwe||type||subtype
    init(dictionaryArry: Array<DictionaryWordEntry>) {
        //shuffle OjibweEnglishDictionary
        self.randomIntForQuestionAssignment = 1
        self.randomIntForTypeOfQuestionAssignment = 1
        var i = 0
        while i <= 10  {
            self.questionWordsArray.append(dictionaryArry[i])
            i = i + 1
        }
        //Have a randomized array of changes to make to the word/entry/etc., assign the actual answer 
        //to a random value of 1-4, and assign the another meaning (either wrong verb person/tense) or wrong noun.
        
        for i in questionWordsArray {
            //switch based upon a) the int in randomIntForQuestionAssignment and b) for what key is the question asking about
            
        }
        
    
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