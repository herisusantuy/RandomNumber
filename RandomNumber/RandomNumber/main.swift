//
//  main.swift
//  RandomNumber
//
//  Created by Heri Susanto on 10/02/21.
//  Copyright © 2021 Heri Susanto. All rights reserved.
//

import Foundation

var randomNumber = 1
var continueGuessing = true
var keepPlaying = true
var input = ""


while keepPlaying {
    // get random number between 0 - 100
    randomNumber = Int(arc4random_uniform(101))
    print("The random number to guess is: \(randomNumber)")
    
    while continueGuessing {
        print ("Pick number between 0 and 100.")
        // get keybord input, and trim the new line
        input = String(bytes: FileHandle.standardInput.availableData, encoding: .utf8)!
        print("here's the input", input)
        input = input.trimmingCharacters(in: .whitespacesAndNewlines)
        // Optional binding if variable input has value it'll create and assign value to variable userGuess
        if let userGuess = Int(input){
            if userGuess == randomNumber {
                continueGuessing = false
                print("Correct answer..!")
            } else if userGuess > randomNumber {
                print("Guess is too hight...")
            } else {
                print("Your guess is too low...")
            }
        } else {
            print("Invalid guess, please try again.")
        }
        
        print ("Play Again? Y or N")
        input = String(bytes: FileHandle.standardInput.availableData, encoding: .utf8)!
        input = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if input == "N" || input == "n" {
            keepPlaying = false
        }
        continueGuessing = true
    }
}

