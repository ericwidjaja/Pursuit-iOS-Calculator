//  ViewController.swift
//  Pursuit-iOS-Calculator
//  Created by Eric Widjaja on 4/7/20.
//  Copyright © 2020 Eric Widjaja. All rights reserved.

/*  12 + 23 = 35?
 previousNumbers
 numbersOnDisplay
 isPerformingOperation
 operation +, -, /, *
 */

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties:
    var numbersOnDisplay: Double = 0
    var previousNumbers: Double = 0
    var operation = 0
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        let numbersTag = sender.tag
        resultLabel.text = resultLabel.text! + String(numbersTag - 1)
    }
    
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        
        let operatorsTag = sender.tag
        
        //AC = All Clear button pressed
        if operatorsTag == 11 {
            resultLabel.text = String(0)
            numbersOnDisplay = 0
            previousNumbers = 0
            operation = 0
            
            
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        resultLabel.text = ""
    }


}

