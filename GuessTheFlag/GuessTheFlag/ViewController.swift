//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Heri Susanto on 10/02/21.
//  Copyright © 2021 Heri Susanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var question = 0
    var message: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain", "uk","us"]
        // settting border with
        firstButton.layer.borderWidth = 1
        secondButton.layer.borderWidth = 1
        thirdButton.layer.borderWidth = 1
        
        // setting border color
        firstButton.layer.borderColor = UIColor.lightGray.cgColor
        secondButton.layer.borderColor = UIColor.lightGray.cgColor
        thirdButton.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        // shuffle is method to randomly reorder the elements of an array
        countries.shuffle()
        // generate random number between 0-2
        correctAnswer = Int.random(in: 0...2)
        firstButton.setImage(UIImage(named: countries[0]), for: .normal)
        secondButton.setImage(UIImage(named: countries[1]), for: .normal)
        thirdButton.setImage(UIImage(named: countries[2]), for: .normal)
        
        // setting title of the page
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        // to count how many question
        question += 1
        // if question already reached 10 the game will be over
        if question <= 10 {
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
                message = "Correct answer! Your score is \(score)"
            } else {
                title = "Wrong"
                score -= 1
                message = "Ooops...Wrong answer! Your score will be minus -1"
            }
            let ac = UIAlertController(title: title, message: "\(message) and you already answered \(question) question", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Info", message: "You have answered \(question) question with total score: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Stop", style: .cancel, handler: askQuestion))
            
            present(ac, animated: true)
            score = 0
            question = 0
        }
        
        
    }
    

}

