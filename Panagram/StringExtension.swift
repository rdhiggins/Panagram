//
//  StringExtension.swift
//  Panagram
//
//  Created by Rodger Higgins on 5/31/16.
//  Copyright © 2016 Spazstik Software. All rights reserved.
//

import Foundation


extension String {
    func isAnagramOfString(s: String) -> Bool {
        let lowerSelf = self.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        let lowerOther = s.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        
        return lowerSelf.characters.sort() == lowerOther.characters.sort()
    }
    
    func isPalindrome() -> Bool {
        let f = self.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        let s = String(f.characters.reverse())
        
        return f == s
    }
}