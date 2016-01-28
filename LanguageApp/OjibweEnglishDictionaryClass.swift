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
    var english: String = ""
    var ojibwe: String = ""
    var type: String = ""
    var subtype: String = ""
    init (aDictionary: Dictionary<String,String>) {
        self.english = aDictionary["english"]!
        self.ojibwe = aDictionary["ojibwe"]!
        self.type = aDictionary["type"]!
        self.subtype = aDictionary["subtype"]!
    }
}

class OjibweEnglishDictionary {
    init () {
        self = init(super)
        var path = NSBundle.mainBundle().pathForResource("DictionaryStoredWords", ofType: "plist")!;
        var rawArray: Array<Dictionary <String, String>> = []
        //    var rawArray: NSMutableArray = []
        
        if () {
            var aRawDiciontary: Dictionary <String, String>
            for aRawDiciontary in rawWordEntryArray {
//                self.rawArray.addObject(aRawDiciontary);
                var rawDict: Dictionary = aRawDiciontary
                var aNewDict = DictionaryWordEntry(rawDict)
            }
        
    }
    
}