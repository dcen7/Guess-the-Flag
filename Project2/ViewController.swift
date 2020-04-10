//
//  ViewController.swift
//  Project2
//
//  Created by Mehmet Deniz Cengiz on 4/7/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
 
    @IBAction func buttonTapped(_ sender: UIButton) {
        var titleAlert: String
        
        if sender.tag == correctAnswer {
            titleAlert = "Correct"
            score += 1
            questionNumber += 1
        }else{
            titleAlert = "Wrong that is the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            questionNumber += 1
        }
        
        title! += " score: \(score)"
        
        let ac: UIAlertController!
        
        if questionNumber == 10 {

            ac = UIAlertController(title: titleAlert, message: "Your final score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
           
        } else {

            ac = UIAlertController(title: titleAlert, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
        }
         present(ac, animated: true)
        
    }
    
    
    @IBAction func scoreBarButton(_ sender: UIBarButtonItem) {
        
        let ac = UIAlertController(title: "Result", message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        present(ac, animated: true)
        
        
    }
    
}

