//
//  OjibweEnglishDictionaryClass.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/15/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//

import Foundation



public class DictionaryWordEntry {
    // write init for Dictionary word entry
    var english: String?
    var ojibwe: String?
    var type: String?
    var subtype: String?
    
    init? (aDictionary: [String:String]) {
        
        for (key, value) in aDictionary {
            switch key {
            case "english":
                self.english = value
            case "ojibwe":
                self.ojibwe = value
            case "type":
                self.type = value
            case "subtype":
                self.subtype = value
            default:
                    return nil
                
            }
        }
    }
}

class OjibweEnglishDictionary {
    var rawMovableArray: NSArray = []
    var usableDictionaryArray: Array<String> = []
//    var pathArray: NSMutableArray
    init () {
        if let path = NSBundle.mainBundle().pathForResource("DictionaryStoredWords", ofType: "plist") {
            rawMovableArray = NSArray(contentsOfFile: path)!
            //self.rawMovableArray = rawArray!
        }
        for aRawDiciontary in rawMovableArray {
            var rawDict: NSDictionary = aRawDiciontary as! NSDictionary
            var aNewDict = DictionaryWordEntry(aDictionary: rawDict as! [String:String])
            self.usableDictionaryArray.append("Hello")
        }
    }
    
}