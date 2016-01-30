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
    var english: String? = ""
    var ojibwe: String? = ""
    var type: String? = ""
    var subtype: String? = ""
    init (aDictionary: Dictionary<String,String>) {
        self.english = aDictionary["english"]!
        self.ojibwe = aDictionary["ojibwe"]!
        self.type = aDictionary["type"]!
        self.subtype = aDictionary["subtype"]!
    }
}

class OjibweEnglishDictionary {
    var rawMovableArray: NSArray = []
//    var pathArray: NSMutableArray
    init () {
        if let path = NSBundle.mainBundle().pathForResource("DictionaryStoredWords", ofType: "plist") {
            let rawArray = NSArray(contentsOfFile: path) 
            self.rawMovableArray = rawArray!
        }
//        var aRawDiciontary: NSDictionary
        for aRawDiciontary in rawMovableArray {
            var rawDict: NSDictionary = aRawDiciontary as! NSDictionary
            var aNewDict = DictionaryWordEntry(aDictionary: rawDict as! Dictionary<String, String>)
        }
    }
    
}