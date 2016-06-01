//
//  Panagram.swift
//  Panagram
//
//  Created by Rodger Higgins on 5/31/16.
//  Copyright © 2016 Spazstik Software. All rights reserved.
//

import Foundation


class Panagram {
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argCount = Process.argc
        let argument = Process.arguments[1]
        let (option, _) = consoleIO.getOption(argument.substringFromIndex(argument.startIndex.advancedBy(1)))

        switch option {
        case .Anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .Error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .Error)
                }
            } else {
                let first = Process.arguments[2]
                let second = Process.arguments[3]
                
                if first.isAnagramOfString(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            }
        case .Palindrome:
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .Error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .Error)
                }
            } else {
                let s = Process.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ") a palindrome")
            }
        case .Help:
            ConsoleIO.printUseage()
        case .Quit: break
        case .Unknown:
            consoleIO.writeMessage("Unknown option value", to: .Error)
            ConsoleIO.printUseage()
        }
    }
    
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Panagram.  This program checks if an input string is an anagram or palindrome")
        
        var shouldQuit = false
        
        while !shouldQuit {
            consoleIO.writeMessage("Type 'a' to check for anagrams or 'p' for palindromes type 'q' to quit.")
            
            let (option, value) = consoleIO.getOption(consoleIO.getInput())
            
            switch option {
            case .Anagram:
                consoleIO.writeMessage("Type the first string: ")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string: ")
                let second = consoleIO.getInput()
                
                if first.isAnagramOfString(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
                
            case .Palindrome:
                consoleIO.writeMessage("Type a word or sentence: ")
                let s = consoleIO.getInput()
                let isPalindrone = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrone ? "" : "not ")a palindrone")
                
            case .Quit:
                shouldQuit = true
                
            default:
                consoleIO.writeMessage("Unknown option \(value)", to: .Error)
            }
        }
    }
}