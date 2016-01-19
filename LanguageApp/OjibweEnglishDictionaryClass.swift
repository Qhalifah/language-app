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
    var english: String = "";
    var ojibwe: String = "";
    var verb, noun, ii, ai, ta, ti, ani, inani: Bool
    init () {
        var theDictionary = OjibweEnglishDictionary(); 
        
        english = "";
        ojibwe = "";
        verb = false;
        noun = false;
        ii = false;
        ai = false;
        ta = false;
        ti = false;
        ani = false;
        inani = false;
        
    }
}

class OjibweEnglishDictionary {
    var path = "";
    var rawArray: NSMutableArray = [];
    
    init () {
        path = NSBundle.mainBundle().pathForResource("DictionaryStoredWords", ofType: "plist")!;
   
        if let rawWordEntryArray = NSArray(contentsOfFile: path) {
        var aRawDiciontary: NSDictionary;
        for aRawDiciontary in rawWordEntryArray {
            self.rawArray.addObject(aRawDiciontary);
            }
        }
    }
    
    
}