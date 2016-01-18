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
    var path = "";
    //var rawWordEntryArray: NSArray = [];
    var theArrayDictionary = [];
    init () {
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
        
        path = String(stringInterpolationSegment: NSBundle.mainBundle().pathForResource("DictionaryStoredWords", ofType: "plist"));
        var rawWordEntryArray = NSArray(contentsOfFile: "path");
        var aRawDiciontary: NSDictionary;
      
    }
}