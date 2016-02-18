//
//  QuizzesViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/15/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
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
    }
    
    
    
    
}

class QuizQuestion: NSObject {

    var questionWordsArray: Array<DictionaryWordEntry> = []
    var objectQuestionText: String = ""
    var objectAnswerOneText: String = ""
    var objectAnswerTwoText:String = ""
    var objectAnswerThreeText: String = ""
    var objectAnswerFourText: String = ""
  
    //Dict word entry is formatted as dictionaryArray.usableDictionaryArray[index].english||ojibwe||type||subtype
    init(dictionaryArry: Array<DictionaryWordEntry>) {
        //shuffle OjibweEnglishDictionary
        var i = 0
        while i <= 10  {
            self.questionWordsArray.append(dictionaryArry[i])
            i = i + 1
        }
        //Have a randomized array of changes to make to the word/entry/etc., assign the actual answer 
        //to a random value of 1-4, and assign the other three to a DWE value changed wit one of the 
        //randomized wrong answers.
    }
    
    
    
    
}