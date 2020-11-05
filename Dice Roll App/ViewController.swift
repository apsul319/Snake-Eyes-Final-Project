//
//  ViewController.swift
//  Dice Roll App
//
//  Created by  on 10/28/20.
//  Copyright © 2020 man. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var betField: UITextField!
    @IBOutlet weak var pointsLabel: UILabel!
    var points: Int = 5000
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        let pointsBet = Int(betField.text!) ?? 0
        view.endEditing(true)
        
    // The program will refuse to run if you bet more than your total points
        
        if pointsBet > points {
                
        infoLabel.text = "You do not have enough points to bet that amount."
            return
            }
        
        let firstNumber = arc4random_uniform(6) + 1
        let secondNumber = arc4random_uniform(6) + 1
        
        print(firstNumber)
        print(secondNumber)
        
        textLabel.text = "Your sum is \(firstNumber + secondNumber)"
        
        leftImageView.image = UIImage(named: "Dice \(firstNumber)")
        
        rightImageView.image = UIImage(named: "Dice \(secondNumber)")
        
        // If the user gets a snake eyes, their bet will be increase twelvefold
        
        if firstNumber + secondNumber == 2 {
            
            self.points += (pointsBet * 12)
            pointsLabel.text = "\(points)"
        }
        else if firstNumber == secondNumber && firstNumber + secondNumber != 2 {
        // If the user gets a double, their bet will increase times 4
            
            self.points += pointsBet * 6
            pointsLabel.text = "\(points)"
        }
        
        // The amount of which you bet is subtracted from your total points

        self.points -= (pointsBet)
        pointsLabel.text = "\(points)"
        
    }
    

}

