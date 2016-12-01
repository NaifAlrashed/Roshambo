//
//  ViewController.swift
//  Roshambo
//
//  Created by Naif Alrashed on 11/30/16.
//  Copyright © 2016 Naif Alrashed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var oponent: chosenMethod!
    var user: chosenMethod!
    var message: String!
    var image: UIImage!
    
    enum chosenMethod {
        case rock
        case scissors
        case paper
    }
    
    func mapIntToChosenMethod (int: Int) -> chosenMethod {
        switch int {
        case 1:
            return .rock
        case 2:
            return .scissors
        case 3:
            return .paper
        default:
            print("error")
            return .rock
        }
    }
    
    func random () -> Int {
        return Int(1 + arc4random() % 3)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        oponent = mapIntToChosenMethod(int: random())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "paper" {
            user = .paper
        }
        
        else if segue.identifier == "scissors" {
            user = .scissors
        }
        
        let controller = segue.destination as! ResultsViewController
        
        determineWinnerWhileChangingMessageAndImage()
        
        controller.image = image
        controller.message = message
        
    }
    
    
    func determineWinnerWhileChangingMessageAndImage () {
        switch user! {
        case .rock where oponent == .rock:
            
            message = "rock doesn't do anything against rock, Tie"
            image = UIImage(named: "itsATie")
            
        case .rock where oponent == .paper:
            
            message = "paper covers rock, you lose!"
            image = UIImage(named: "PaperCoversRock")
            
        case .rock where oponent == .scissors:
            
            message = "rock crushes scissors, you win!"
            image = UIImage(named: "RockCrushesScissors")
            
        case .paper where oponent == .rock:
            
            message = "paper covers rock, you win!"
            image = UIImage(named: "PaperCoversRock")
            
        case .paper where oponent == .paper:
            
            message = "paper doesn't do anything against paper, Tie"
            image = UIImage(named: "itsATie")
            
        case .paper where oponent == .scissors:
            
            message = "scissors cuts paper, you lose!"
            image = UIImage(named: "ScissorsCutsPaper")
            
        case .scissors where oponent == .rock:
            
            message = "rock crushes scissors, you lose!"
            image = UIImage(named: "RockCrushesScissors")
            
        case .scissors where oponent == .paper:
            
            message = "scissors cuts paper, you win!"
            image = UIImage(named: "ScissorsCutsPaper")
            
        case .scissors where oponent == .scissors:
            
            message = "scissors doesn't do anything against scissors, Tie"
            image = UIImage(named: "itsATie")
            
        default:
            print("error")
        }
    }
    @IBAction func paperAction(_ sender: Any) {
        user = .paper
        
        performSegue(withIdentifier: "paper", sender: nil)
    }
    @IBAction func rockAction(_ sender: Any) {
        user = .rock
        
        let controller: ResultsViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "resultsStorboard")
            as! ResultsViewController
        
        determineWinnerWhileChangingMessageAndImage()
        
        controller.image = image
        controller.message = message
        
        present(controller, animated: true, completion: nil)
        
        
        
    }
    
    
}

