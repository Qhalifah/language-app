//
//  QuizObjectAndQuestion.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 5/4/16.
//  Copyright © 2016 Schmitty B Smith. All rights reserved.
//

import Foundation

class QuizObject: NSObject {
    
    var questionWordsArray: [DictionaryWordEntry] = []
    var questionArray: [QuizQuestion] = []
    var wrongAnswersDictArray: [[DictionaryWordEntry]] = []
    var totalQuizQuestionsNumber: Int = 0
    
    var rand: UInt32 = 0
    var randWrong: UInt32 = 0
    
    init(dictionaryArry: [DictionaryWordEntry]?, numberQuestions: Int) {
        super.init()
        if dictionaryArry == nil { }
        else {
            self.totalQuizQuestionsNumber = numberQuestions
            for _ in 0...(numberQuestions - 1) {
                
                //keep an Eye on the rand's here - order was changed so Array.appends are with their respective generating code, so as to make more sense.
                rand = arc4random_uniform(UInt32(dictionaryArry!.count))
                questionWordsArray.append(dictionaryArry![Int(rand)])
                
                var array: [DictionaryWordEntry] = []
                for _ in 0...2 {
                    randWrong = arc4random_uniform(UInt32(dictionaryArry!.count))
                    while randWrong == rand {
                        randWrong = arc4random_uniform(UInt32(dictionaryArry!.count))
                    }
                    array.append(dictionaryArry![Int(randWrong)])
                }
                wrongAnswersDictArray.append(array)
                
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
        if i.type != "english" || i.type != "ojibwe" {
            randomInt = arc4random_uniform(UInt32(2))
        }
        else { randomInt = arc4random_uniform(UInt32(3)) }
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
            
        }
        else if i.type == "verb" {
            
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